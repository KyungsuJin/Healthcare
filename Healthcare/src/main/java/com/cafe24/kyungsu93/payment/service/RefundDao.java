package com.cafe24.kyungsu93.payment.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RefundDao {
	
	private static final Logger logger = LoggerFactory.getLogger(RefundDao.class);
	@Autowired
	private SqlSessionTemplate sqlSession;
	final String NS = "com.cafe24.kyungsu93.payment.service.RefundMapper.";
		
	//환불 등록번호 최대값 검색
	public int refundMaxNo() {
		logger.debug("RefundDao - refundNo 실행");
		return sqlSession.selectOne(NS+"refundNo");
	}
	
	//환불 신청
	public int addrefund(Refund refund) {
		logger.debug("RefundDao - addrefund 실행");
		int row = sqlSession.insert(NS+"addrefund", refund);
		return row;
	}
	
	//환불 지급 완료 전체 게시물 수 검색
	public int refundCompleteTotalCount() {
		logger.debug("RefundDao - refundCompleteTotalCount 실행");
		return sqlSession.selectOne(NS+"refundCompleteTotalCount");
	}
		
	//환불 지급 완료 리스트
	public List<Refund> refundCompleteList(Map<String,Integer> map) {
		logger.debug("RefundDao - refundCompleteList 실행");
		 List<Refund> list = sqlSession.selectList(NS+"refundCompleteList",map);
		return list;
	}
	
	//환불 승인 전체 게시물 수 검색
	public int refundApprovalTotalCount() {
		logger.debug("RefundDao - refundApprovalTotalCount 실행");
		return sqlSession.selectOne(NS+"refundApprovalTotalCount");
	}
		
	//환불 승인 리스트
	public List<Refund> refundApprovalList(Map<String,Integer> map) {
		logger.debug("RefundDao - refundApprovalList 실행");
		 List<Refund> list = sqlSession.selectList(NS+"refundApprovalList",map);
		return list;
	}
	
	//환불 승인 대기 전체 검색
	public int refundTotalCount() {
		logger.debug("RefundDao - refundTotalCount 실행");
		return sqlSession.selectOne(NS+"refundTotalCount");
	}
		
	//환불 승인 대기 리스트
	public List<Refund> refundList(Map<String,Integer> map) {
		logger.debug("RefundDao - refundList 실행");
		 List<Refund> list = sqlSession.selectList(NS+"refundList",map);
		return list;
	}
}
