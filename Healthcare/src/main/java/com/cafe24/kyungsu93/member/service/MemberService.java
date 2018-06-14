package com.cafe24.kyungsu93.member.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.kyungsu93.member.controller.MemberController;

@Service
@Transactional
public class MemberService {
	@Autowired MemberDao memberDao;
	@Autowired MemberFileDao memberFileDao;
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	/* 회원레벨 level
	 * Level 1: 관리자
	 * Level 2: 일반(기본)회원
	 * Level 3: 의사회원
	 * Level 4: PT 회원
	 */
	
	//회원가입 과정
	public void memberInsert(Member member,String path) {
		logger.debug("MemberService.memberInsert");
		int result = (memberDao.memberNo())+1;//회원번호 등록
		int level = member.getMemberLevel();//레벨에따라 테이블이 다르므로 분기
		logger.debug("result:"+result);
		String memberNo = "member_";
		member.setMemberNo(memberNo+result);
		
		if(level==2) {
			logger.debug("일반회원");
			memberDao.memberInsert(member);
		}else if(level==3) {
			logger.debug("의사회원");
			memberDao.memberInsert(member);
			memberDao.memberInsertDoctor(member);
			memberfile(member.getMultipartFile(),path);
			
		}else if(level==4) {
			logger.debug("피티회원");
			memberDao.memberInsert(member);
			memberDao.memberInsertPt(member);
			memberfile(member.getTeacherMultipartFile(),path);
		}
	}
	//아이디 중복체크
	public int memberIdCheck(String id) {
		logger.debug("MemberService.memberIdCheck");
		logger.debug(id);
		return memberDao.memberIdCheck(id);
	}
	//파일저장
	public void memberfile(MultipartFile multipartFile,String path) {
		logger.debug("MemberService.memberfile");
		MemberFile memberFile = new MemberFile();
		int result = (memberDao.memberNo());
		String memberNo = "member_";
		memberFile.setMemberNo(memberNo+result);
		UUID uuid = UUID.randomUUID(); //랜덤한 id 값 생성
		String fileName =uuid.toString().replaceAll("-", "");//랜덤한 id 값의 - 를 공백으로 바꿔준다.
		memberFile.setMemberFileName(fileName);
		String fileExt = multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf(".")+1);//파일 확장자
		memberFile.setMemberFileExt(fileExt);
		memberFile.setMemberFileSize(multipartFile.getSize());//파일사이즈
		memberFile.setMemberFileRealName(multipartFile.getOriginalFilename());//파일의 원래이름
		memberFile.setMemberFileType(multipartFile.getContentType());//파일타입
		logger.debug(memberFile.toString());
		logger.debug(path);
		File file = new File(path+fileName+"."+fileExt);//파일의 경로 지정
		logger.debug("file : "+file);
		memberFileDao.memberFile(memberFile);
		try {
			//파일을 해당경로로 옮긴다.
			multipartFile.transferTo(file);
		}catch(IOException e) {
			e.printStackTrace();
		}catch(IllegalStateException e) {
			e.printStackTrace();
		}
	}
	//회원정보수정전 패스워드 체크
	public int memberModifyCheck(Member member) {
		logger.debug("MemberService.memberModifyCheck");
		return memberDao.memberModifyCheck(member);
	}
	//회원정보수정 전 정보
	public Member memberModifySelect(Member member) {
		logger.debug("MemberService.memberModifySelect");
		int level =member.getMemberLevel();
		String id =member.getMemberId();
		Member memberImpormation= new Member();
		if(level==1 ||level==2) {
			memberImpormation=memberDao.memberModifySelect(id);
		}else if(level==3) {
			memberImpormation=memberDao.memberModifySelectDoctor(id);
		}else if(level==4) {
			memberImpormation=memberDao.memberModifySelectTeacher(id);
		}
		return memberImpormation;
	}
	//회원정보 수정
	public void memberModify(Member member) {
		logger.debug("MemberService.memberModify");
		int level = member.getMemberLevel();
		if(level==1||level==2) {
			memberDao.memberModify(member);
		}else if(level==3) {
			memberDao.memeberModifyDoctor(member);
		}else if(level==4) {
			memberDao.memeberModifyTeacher(member);
		}
	}
	//회원탈퇴 요청
	public void memberLeaveRequest(Member member,String path) {
		logger.debug("MemberService.memberLeaveRequest");
		int level = member.getMemberLevel();
		String id =member.getMemberId();
		String memberNo;
		if(level==1||level==2) {
			memberDao.memberLeaveRequest(id);
		}else if(level==3) {
			memberNo=memberDao.memberLeaveSelect(id);
			logger.debug("memberNo : "+memberNo);
			memberDao.memberLeaveDoctorRequest(memberNo);
			memberFile(memberNo,path);//의사회원 또는피티 회원은 파일이 있기때문에 파일삭제 부분
			memberDao.FileRemove(memberNo);
			memberDao.memberLeaveRequest(id);
		}else if(level==4) {
			memberNo=memberDao.memberLeaveSelect(id);
			memberDao.memberLeaveTeacherRequest(memberNo);
			memberFile(memberNo,path);
			memberDao.FileRemove(memberNo);
			memberDao.memberLeaveRequest(id);
		}
	}
	//파일 삭제
	public void memberFile(String MemberNo,String path) {
		logger.debug("MemberService.memberFile");
		MemberFile memberFile=memberDao.memberFile(MemberNo);
		File file = new File(path+memberFile.getMemberFileName()+"."+memberFile.getMemberFileExt());
		file.delete();
	}
	//승인을 기다리는 의사,PT 회원들의 목록(페이징)
	public Map<String,Object> memberApprovalList(int currentPage,int pagePerRow) {
		logger.debug("MemberService.memberApprovalList");
		Map<String,Integer> map = new HashMap<String,Integer>();
		int beginRow = (currentPage-1)*10;//LIMIT 의 앞부분을 구한다
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		List<Member> memberList=memberDao.memberApprovalList(map);
		int totalCountList =memberDao.totalCountList();//게시물의 총개수
		int lastPage=totalCountList/pagePerRow;//마지막 페이지를 구한다
		if(totalCountList%pagePerRow>0) {//한페이지에 10개씩 보여주고 총게시물이 101개라면 페이지는 11페이지가 되어야하는데 10페이지되므로 사용해준다.
			lastPage++;
		}
		int startPage=((currentPage-1)/10)*10+1;//숫자 페이징작업 밑부분 보여질 시작 범위
		int endPage = startPage+pagePerRow-1;//숫자 페이징 작업 밑부분 보여줄 마지막 범위
		if(endPage>lastPage) {
			endPage=lastPage;
		}
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("startPage", startPage);
		returnMap.put("endPage", endPage);
		returnMap.put("lastPage", lastPage);
		returnMap.put("memberList", memberList);
		return returnMap;
	}
	//승인을 기다리는 의사,PT 회원들의 상세정보
	public Member memberApprovalContent(Member member) {
		logger.debug("MemberService.memberApprovalContent");
		Member memberContent = new Member();
		int level = member.getMemberLevel();
		logger.debug("levle:"+level);
		if(level==3) {
			memberContent=memberDao.memberApprovalContentLevel3(member);
			memberContent.setMemberLevel(level);
		}else if(level==4) {
			memberContent=memberDao.memberApprovalContentLevel4(member);
			memberContent.setMemberLevel(level);
		}
		
		return memberContent;
	}
	//관리자의 승인하기
	public void approval(Member member) {
		logger.debug("MemberService.approval");
		int level = member.getMemberLevel();
		if(level==3) {
			memberDao.approvalDoctor(member);
		}else if(level==4) {
			memberDao.approvalTeacher(member);
		}
	}
	//아이디 찾기
	public String memberFindId(Member member) {
		logger.debug("MemberService.approval");

		String memberId=memberDao.memberFindId(member);
		if(memberId==null) {
			memberId="0";
		}
		return memberId;
	}
	//비밀번호 찾기
	public String memberFindPw(Member member) {
		logger.debug("MemberService.memberFindPw");
		String memberPw=memberDao.memberFindPw(member);
		if(memberPw==null) {
			memberPw="0";
		}
		return memberPw;
	}
	//회원(의사,PT) 리스트,검색,페이징
	public Map<String,Object> memberList(int currentPage,int pagePerRow,int memberLevel,String searchText,String searchSelect) {
		logger.debug("MemberService.memberList");
		int beginRow=(currentPage-1)*10;
		int totalCountList=0;
		List<Member> memberList = new ArrayList<Member>();//회원 리스트를 담을 list
		Map<String,Integer> map = new HashMap<String,Integer>();//페이징 게시물 보여줄 개수를 등록하기위한 map
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		Map<String,Object> searchMap = new HashMap<String,Object>();//검색한정보+페이징 정보를 담기위한 map
		searchMap.put("searchText", searchText);
		searchMap.put("searchSelect", searchSelect);
		searchMap.put("beginRow", beginRow);
		searchMap.put("pagePerRow", pagePerRow);
		
		if(memberLevel==2 && !searchText.equals("")) {//레빌이 기본회원이고 검색정보가 공백이 아니면
			memberList=memberDao.memberSeachList(searchMap);//검색한 리스트를 가져와 memberㅣist에 담는다
			totalCountList=memberDao.memberSearchListTotal(searchMap);//검색한 리스트의 총 count
		}else if(memberLevel==3 && !searchText.equals("")) {
			memberList=memberDao.DoctorMemberSeachList(searchMap);
			totalCountList=memberDao.DoctorMemberSearchListTotal(searchMap);
		}else if(memberLevel==4 && !searchText.equals("")) {
			memberList=memberDao.PtMemberSeachList(searchMap);
			totalCountList=memberDao.PtMemberSearchListTotal(searchMap);
			
		}
		
		
		if(memberLevel==2 && searchText.equals("")) {//레벨이 기본회원이고 검색한정보가 공배이면
			memberList=memberDao.memberList(map);//기본회원의 리스트를 가져와 memberList 담는다
			totalCountList=memberDao.memberListTotal();//기본회원 리스트의 총count 
		}else if(memberLevel==3 && searchText.equals("")){
			memberList=memberDao.memberDoctorList(map);
			totalCountList=memberDao.memberDoctorListTotal();
		}else if(memberLevel==4 && searchText.equals("")) {
			memberList=memberDao.memberPtList(map);
			totalCountList=memberDao.memberPtListTotal();
		}
		int lastPage=totalCountList/pagePerRow; //마지막 페이지 count
		int startPage=((currentPage-1)/10)*10+1; //페이징 작업에 보여줄 시작 페이지
		int endPage=startPage+pagePerRow-1; //페이징 작업에 보여줄 끝 페이지
		if(totalCountList%pagePerRow>0) {//한페이지에 10개씩 보여주고 총게시물이 101개라면 페이지는 11페이지가 되어야하는데 10페이지되므로 사용해준다.
			lastPage++;
		}
		if(endPage>lastPage) {
			endPage=lastPage;
		}
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("startPage", startPage);
		returnMap.put("endPage", endPage);
		returnMap.put("lastPage", lastPage);
		returnMap.put("memberList", memberList);
		return returnMap;
	}

}
