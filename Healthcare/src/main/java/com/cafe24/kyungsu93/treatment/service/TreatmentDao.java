package com.cafe24.kyungsu93.treatment.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TreatmentDao {
	private static final Logger logger = LoggerFactory.getLogger(TreatmentDao.class);

	@Autowired private SqlSessionTemplate sqlSession;
	final String NS = "com.cafe24.kyungsu93.treatment.service.TreatmentMapper.";
	
	public int getTreatmentNo() {
		return sqlSession.selectOne(NS+"getTreatmentNo"); 
	}
	public void addTreatment(TreatmentRequest treatmentRequest) {
		System.out.println("dao : "+treatmentRequest.getMemberNo());
		logger.debug("TreatmentDao.addTreatment 메서드 호출");
		sqlSession.insert(NS + "addTreatment", treatmentRequest);
	}
	
	public int treatmentTotalCount() {
		return sqlSession.selectOne(NS+"treatmentTotalCount");
	}
	
	public List<TreatmentResponse> getTreatmentList(Map map){
		logger.debug("TreatmentDao.getTreatmentList.map : " + map);
		List<TreatmentResponse> list = sqlSession.selectList(NS+"getTreatmentList", map);
		return list;
	}
	
	public TreatmentResponse getTreatmentContent(TreatmentRequest treatmentRequest) {
		TreatmentResponse treatmentResponse = sqlSession.selectOne(NS+"getTreatmentContent", treatmentRequest);
		return treatmentResponse;
	}
	
	public void removeTreatment(TreatmentRequest treatmentRequest) {
		sqlSession.delete(NS+"removeTreatment", treatmentRequest);
	}
	
	public void modifyTreatment(TreatmentRequest treatmentRequest) {
		logger.debug("TreatmentDao.modifyTreatment.treatmentRequest : " + treatmentRequest);
		sqlSession.update(NS+"modifyTreatment",treatmentRequest);
	}
	
	public List<TreatmentResponse> getTreatmentClosest(TreatmentResponse treatmentResponse) {
		return sqlSession.selectList(NS+"getTreatmentClosest", treatmentResponse);
	}
}
