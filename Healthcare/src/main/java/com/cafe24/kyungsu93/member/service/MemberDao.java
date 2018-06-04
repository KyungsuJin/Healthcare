package com.cafe24.kyungsu93.member.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
	@Autowired SqlSessionTemplate sqlSession;
	
	private static final Logger logger= LoggerFactory.getLogger(MemberDao.class);
	final String NS = "com.cafe24.kyungsu93.MemberMapper.";
	//memberNo의 제일큰 번호를 구하는메서드
	public int memberNo() {
		logger.debug("MemberDao.memberNo");
		return sqlSession.selectOne(NS+"memberNo");
	}
	//회원가입 일반회원
	public int memberInsert(Member member) {
		logger.debug("MemberDao.memberInsert");
		return sqlSession.insert(NS+"memberInsert",member);
	}
	//회원가입 의사회원
	public int memberInsertDoctor(Member member) {
		logger.debug("MemberDao.memberInsertDoctor");
		return sqlSession.insert(NS+"memberInsertDoctor",member);
	}
	//회원가입 PT
	public int memberInsertPt(Member member) {
		logger.debug("MemberDao.memberInsertPt");
		return sqlSession.insert(NS+"memberInsertPt",member);
	}
	//아이디중복확인 메서드
	public int memberIdCheck(String id) {
		logger.debug("MemberDao.memberIdCheck");
		int result=sqlSession.selectOne(NS+"memberIdCheck",id);
		logger.debug("result :"+result);
		return result;
	}
	//회원 정보 수정 전 비밀번호 체크
	public int memberModifyCheck(Member member) {
		logger.debug("MemberDao.memberModifyCheck");
		return sqlSession.selectOne(NS+"memberModifyCheck",member);
	}
	//회원 회원정보수정 할 정보
	public Member memberModifySelect(String id) {
		logger.debug("MemberDao.memberModifySelect");
		return sqlSession.selectOne(NS+"memberModifySelect",id);
		
	}
	//의사 회원정보수정 할 정보
	public Member memberModifySelectDoctor(String id) {
		logger.debug("MemberDao.memberModifySelectDoctor");
		return sqlSession.selectOne(NS+"memberModifySelectDoctor",id);
	}
	//PT 회원정보수정 창 정보
	public Member memberModifySelectTeacher(String id) {
		logger.debug("MemberDao.memberModifySelectTeacher");
		return sqlSession.selectOne(NS+"memberModifySelectTeacher",id);
	}
	//회원 정보 수정
	public void memberModify(Member member) {
		logger.debug("MemberDao.memberModifySelectTeacher");
		sqlSession.update(NS+"memberModify",member);
	}
	//의사 회원 정보 수정
	public void memeberModifyDoctor(Member member) {
		sqlSession.update(NS+"memeberModifyDoctor",member);
	}
	//PT 회원 정보 수정
	public void memeberModifyTeacher(Member member) {
		sqlSession.update(NS+"memeberModifyTeacher",member);
	}
	//회원 탈퇴 요청
	public void memberLeaveRequest(String id) {
		logger.debug("MemberDao.memberLeaveRequest");
		sqlSession.delete(NS+"memberLeaveRequest",id);
	}
	//의사 탈퇴 요청
	public void memberLeaveDoctorRequest(String memberNo) {
		logger.debug("MemberDao.memberLeaveDoctorRequest");
		sqlSession.delete(NS+"memberLeaveDoctorRequest",memberNo);
	}
	//의사,PT 파일 제거
	public void FileRemove(String memberNo) {
		logger.debug("MemberDao.FileRemove");
		sqlSession.delete(NS+"FileRemove",memberNo);
	}

	//PT 탈퇴 요청
	public void memberLeaveTeacherRequest(String memberNo) {
		logger.debug("MemberDao.memberLeaveTeacherRequest");
		sqlSession.delete(NS+"memberLeaveTeacherRequest",memberNo);
	}
	//회원 탈퇴
	public String memberLeaveSelect(String id) {
		logger.debug("MemberDao.memberLeaveSelect");
		return sqlSession.selectOne(NS+"memberLeaveSelect",id);
	}
	//의사 ,PT 파일목록
	public MemberFile memberFile(String MemberNo) {
		logger.debug("MemberDao.memberFile");
		return sqlSession.selectOne(NS+"memberFile",MemberNo);
	}
	//의사,PT 승인이 필요한 LIST
	public List<Member> memberApprovalList(Map<String,Integer> map) {
		logger.debug("MemberDao.memberApprovalList");
		return sqlSession.selectList(NS+"memberApprovalList",map);
	}
	//의사,PT 리스트의 COUNT
	public int totalCountList() {
		logger.debug("MemberDao.totalCountList");
		return sqlSession.selectOne(NS+"totalCountList");
	}
	//의사 승인 내용
	public Member memberApprovalContentLevel3(Member member) {
		logger.debug("MemberDao.memberApprovalContentLevel3");
		return sqlSession.selectOne(NS+"memberApprovalContentLevel3",member);
	}
	//PT 승인 내용
	public Member memberApprovalContentLevel4(Member member) {
		logger.debug("MemberDao.memberApprovalContentLevel3");
		return sqlSession.selectOne(NS+"memberApprovalContentLevel4",member);
	}
	//의사 승인
	public void approvalDoctor(Member member) {
		logger.debug("MemberDao.approvalDoctor");
		sqlSession.update(NS+"approvalDoctor",member);
	}
	//PT승인
	public void approvalTeacher(Member member) {
		logger.debug("MemberDao.approvalTeacher");
		sqlSession.update(NS+"approvalTeacher",member);
	}
	//id찾기
	public String memberFindId(Member member) {
		logger.debug("MemberDao.memberFindId");
		return sqlSession.selectOne(NS+"memberFindId",member);
	}
	//pw찾기
	public String memberFindPw(Member member) {
		logger.debug("MemberDao.memberFindPw");
		return sqlSession.selectOne(NS+"memberFindPw",member);
	}
	//회원 리스트
	public List<Member> memberList(Map<String,Integer> map) {
		logger.debug("MemberDao.memberList");
		return sqlSession.selectList(NS+"memberList",map);
	}
	//의사회원 리스트
	public List<Member> memberDoctorList(Map<String,Integer> map) {
		logger.debug("MemberDao.memberList");
		return sqlSession.selectList(NS+"memberDoctorList",map);
	}
	//의사회원 총수
	public int memberDoctorListTotal() {
		return sqlSession.selectOne(NS+"memberDoctorListTotal");
	}
	//회원 총수
	public int memberListTotal() {
		return sqlSession.selectOne(NS+"memberListTotal");
	}
	//PT회원 리스트
	public List<Member> memberPtList(Map<String,Integer> map) {
		logger.debug("MemberDao.memberPtList");
		return sqlSession.selectList(NS+"memberPtList",map);
	}
	//PT회원 총수
	public int memberPtListTotal() {
		return sqlSession.selectOne(NS+"memberPtListTotal");
	}
}
