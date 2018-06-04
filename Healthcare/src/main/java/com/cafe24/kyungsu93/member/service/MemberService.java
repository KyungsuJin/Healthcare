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
	//회원가입 과정
	public String memberInsert(Member member,String path) {
		logger.debug("MemberService.memberInsert");
		int result = (memberDao.memberNo())+1;
		int level = member.getMemberLevel();
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
		}else {
			
		}
		
		return "";
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
		UUID uuid = UUID.randomUUID();
		String fileName =uuid.toString().replaceAll("-", "");
		memberFile.setMemberFileName(fileName);
		String fileExt = multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf(".")+1);
		memberFile.setMemberFileExt(fileExt);
		memberFile.setMemberFileSize(multipartFile.getSize());
		memberFile.setMemberFileRealName(multipartFile.getOriginalFilename());
		memberFile.setMemberFileType(multipartFile.getContentType());
		logger.debug(memberFile.toString());
		logger.debug(path);
		File file = new File(path+fileName+"."+fileExt);
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
			logger.debug("-0--------------"+memberNo);
			memberDao.memberLeaveDoctorRequest(memberNo);
			memberFile(memberNo,path);
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
	//회원 리스트
	public Map<String,Object> memberList(int currentPage,int pagePerRow,int memberLevel) {
		int beginRow=(currentPage-1)*10;
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		List<Member> memberList = new ArrayList<Member>();
		int totalCountList=0;
		if(memberLevel==2) {
			memberList=memberDao.memberList(map);
			totalCountList=memberDao.memberListTotal();
		}else if(memberLevel==3){
			memberList=memberDao.memberDoctorList(map);
			totalCountList=memberDao.memberDoctorListTotal();
		}else if(memberLevel==4) {
			memberList=memberDao.memberPtList(map);
			totalCountList=memberDao.memberPtListTotal();
		}
		int lastPage=totalCountList/pagePerRow;
		int startPage=((currentPage-1)/10)*10+1;
		int endPage=startPage+pagePerRow-1;
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
