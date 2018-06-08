package com.cafe24.kyungsu93.bloodpressure.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BloodPressureDao {
	private static final Logger logger = LoggerFactory.getLogger(BloodPressureDao.class);
	@Autowired
	private SqlSessionTemplate sqlSession;
	final String NS = "com.cafe24.kyungsu93.bloodpressure.service.BloodPressureMapper.";

	public List<BloodPressure> selectBloodPressureChart(String memeberNo) {
		logger.debug("BloodPressureDao - selectBlppdPressureChart 실행");
		List<BloodPressure> list = sqlSession.selectList(NS+"bloodPressurechart",memeberNo);
		return list;
	}
	
	public int updateBloodPressure(BloodPressure bloodPressure) {
		logger.debug("BloodPressureDao - updateBloodPressure 실행");
		return sqlSession.update(NS+"updateBloodPressure",bloodPressure);
    }
	
	public BloodPressure selectBloodPressureOne(String bloodPressureNo) {
		logger.debug("BloodPressureDao - selectBloodPressureOne 실행");
		return sqlSession.selectOne(NS+"bloodPressureOne",bloodPressureNo);
	}
	
	public int deletePressureCount(String bloodPressureNo) {
		logger.debug("BloodPressureDao - deletePressureCount 실행");
		return sqlSession.delete(NS+"deleteBloodPressure",bloodPressureNo);
    }
	
	public List<BloodPressure> bloodPressureList(Map<String,Integer> map) {
		logger.debug("BloodPressureDao - bloodPressureList 실행");
		 List<BloodPressure> list = sqlSession.selectList(NS+"bloodPressureList",map);
		return list;
	}
		
	public int bloodPressureCount() {
		logger.debug("BloodPressureDao - bloodPressureCount 실행");
		return sqlSession.selectOne(NS+"bloodPressureCount");
	}
	
	public int selectBloodPressureId(String bloodPressureNo) {
		logger.debug("BloodPressureDao - selectBloodPressureId 실행");
		int row = sqlSession.selectOne(NS+"BloodPressureId",bloodPressureNo);
		return row;
	}
		
	public int addBloodPressure(BloodPressure bloodPressure) {
		logger.debug("BloodPressureDao - addBloodPressure 실행");
		int row = sqlSession.insert(NS+"addBloodPressure",bloodPressure);
		return row;
	}
	
}
