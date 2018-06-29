package com.cafe24.kyungsu93.helper.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HelperDao {
	private static final Logger logger = LoggerFactory.getLogger(HelperDao.class);
	String NS = "com.cafe24.kyungsu93.helper.service.HelperMapper.";
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<Sanction> getSanctionKindList() {
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
