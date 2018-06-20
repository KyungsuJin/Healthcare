package com.cafe24.kyungsu93.doctorrequest.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.kyungsu93.bloodsugar.controller.BloodsugarController;
import com.cafe24.kyungsu93.bloodsugar.service.BloodSugar;
import com.cafe24.kyungsu93.member.service.Member;

@Repository
public class DoctorRequestDao {
	private static final Logger logger = LoggerFactory.getLogger(BloodsugarController.class);
	@Autowired
	private SqlSessionTemplate sqlSession;
	final String NS = "com.cafe24.kyungsu93.doctorrequest.service.DoctorRequestMapper.";
	/*public List<DoctorRequest> doctorrequestList(Map<String,Integer> map) {
	logger.debug("2번-2"+map);
	logger.debug("DoctorRequestDao 에서 DoctorRequest 실행");
	return sqlSession.selectList(NS+"doctorrequestList",map);
	}*/
	
	public List<DoctorRequest> doctorRequestList(Map<String,Integer> map) {
		logger.debug("DoctorRequestDao 에서 doctorRequestList 실행");
		logger.debug("3번"+map);
		return sqlSession.selectList(NS+"doctorRequestList",map);
	}
	
	public int doctorRequestCount() {
		logger.debug("DoctorRequestDao 에서 doctorRequestCount 실행");
		return sqlSession.selectOne(NS+"doctorRequestCount");
	}
	public List<Member> memberNo(String memberNo) {
		logger.debug("23번"+memberNo);
		return sqlSession.selectList(NS+"memberNo",memberNo);
	}
}