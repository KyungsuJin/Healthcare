package com.cafe24.kyungsu93.helper.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.kyungsu93.member.service.Member;

@Repository
public class HelperDao {
	private static final Logger logger = LoggerFactory.getLogger(HelperDao.class);
	String NS = "com.cafe24.kyungsu93.helper.service.HelperMapper.";
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//제재 삭제하기
	public int removeSanction(String sanctionNo) {
		logger.debug("HelperService_removeSanction");
		return sqlSession.delete(NS+"deleteSanction", sanctionNo);
	}
	//제재 리스트
	public List<Sanction> getAllSanctionList() {
		logger.debug("HelperDao_selectGetAllSanctionList");
		return sqlSession.selectList(NS+"selectGetAllSanctionList");
	}
	//제재 포인트 회수
	public int updateMemberPoint(Sanction sanction) {
		logger.debug("HelperController_updateMemberPoint");
		return sqlSession.update(NS+"updateMemberPoint", sanction);
	}
	//제재 Pk
	public int selectSanctionNo() {
		logger.debug("HelperController_selectSanctionNo");
		return sqlSession.selectOne(NS+"selectSanctionNo");
	}
	//제재 추가하기
	public int addSanction(Sanction sanction) {
		logger.debug("HelperController_addSanction");
		return sqlSession.insert(NS+"insertSanction", sanction);
	}
	//제재를 하기위해 아이디 검색
	public Member selectMemberIdForSanction(String memberId) {
		logger.debug("HelperController_selectMemberIdForSanction");
		return sqlSession.selectOne(NS+"selectMemberIdForSanction", memberId);
	}
	//complain PK 생성
	public int selectInquireNo() {
		logger.debug("HelperController_selectInquireNo");	
		return sqlSession.delete(NS+"selectComplainNo");
	}
	//신고 취소하기
	public int removeComplain(String complainNo) {
		logger.debug("HelperController_removeComplain");	
		return sqlSession.delete(NS+"deleteComplain", complainNo);
	}
	//신고에 대한 답변을 보여준다.
	public ComplainAnswer getComplainAnswer(String complainNo) {
		logger.debug("HelperService_getComplainAnswer");
		return sqlSession.selectOne(NS+"selectgetComplainAnswer", complainNo);
	}
	//신고 답변의 count를 조회한다. 잇으면 리스트 아래 답글이생김
	public int selectComplainAnswerCount(String complainNo) {
		return sqlSession.selectOne(NS+"selectComplainAnswerCount", complainNo);
	}
	//신고에 대한 답변 등록
	public int addComplainAnswer(ComplainAnswer complainAnswer) {
		logger.debug("HelperService_addComplainAnswer");
		return sqlSession.insert(NS+"insertComplainAnswer", complainAnswer);
	}
	//관리자가 모든 신고 리스트 보기
	public List<Complain> getAllComplainList() {
		logger.debug("HelperService_getAllComplainList");
		return sqlSession.selectList(NS+"selectGetAllComplainList");
	}
	//신고리스트
	public List<Complain> getComplainList(String memberNo) {
		logger.debug("HelperDao_getComplainList");
		return sqlSession.selectList(NS+"selectGetComplainList", memberNo);
	}
	//신고 Pk
	public int selectComplainNo() {
		logger.debug("HelperDao_selectComplainNo");
		return sqlSession.selectOne(NS+"selectComplainNo");
	}
	//신고하기
	public int addComplain(Complain complain) {
		logger.debug("HelperDao_addComplain");
		return sqlSession.insert(NS+"insertComplain", complain);
	}
	//제재 종류 리스트
	public List<SanctionKind> getSanctionKindList() {
		logger.debug("HelperService_getSanctionKindList");
		return sqlSession.selectList(NS+"selectGetSanctionKindList");
	}
	//문의 삭제하기 전 문의 답변 삭제하기
	public int removeInquireAnswer(String inquireNo) {
		logger.debug("HelperService_removeInquireAnswer");
		return sqlSession.delete(NS+"deleteInquireAnswer", inquireNo);
	}
	//문의 삭제하기
	public int removeInquire(String inquireNo) {
		logger.debug("HelperService_removeInquire");
		return sqlSession.delete(NS+"deleteInquire", inquireNo);
	}
	//문의 답글 보기
	public InquireAnswer getInquireAnswer(String inquireNo) {
		logger.debug("HelperService_getInquireAnswer");
		return sqlSession.selectOne(NS+"selectgetInquireAnswer", inquireNo);
	}
	//답글의 count를 조회한다. 잇으면 리스트 아래 답글이생김
	public int selectInquireAnswerCount(String inquireNo) {
		return sqlSession.selectOne(NS+"selectInquireAnswerCount", inquireNo);
	}
	public int addInquireAnswer(InquireAnswer inquireAnswer) {
		logger.debug("HelperDao_addInquireAnswer");
		return sqlSession.insert(NS+"insertInquireAnswer", inquireAnswer);
	}
	//관리자가 모든 문의 리스트 보기
	public List<Inquire> getAllInquireList() {
		logger.debug("HelperDao_getAllInquireList");
		return sqlSession.selectList(NS+"SelectgetAllInquireList");
	}
	//자신이 문의한 리스트보기
	public List<Inquire> getInquireList(String memberNo) {
		logger.debug("HelperDao_getInquireList");
		return sqlSession.selectList(NS+"SelectGetInquireList", memberNo);
	}
	//문의 추가
	public int addInquire(Inquire inquire) {
		logger.debug("HelperService_addInquire");
		
		return sqlSession.insert(NS+"insertInquire", inquire);
	}
}
