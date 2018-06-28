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
	
	public int bloodPressureNoCountToHealthScreen(String bloodPressureNo) {
		logger.debug("BloodPressureDao - bloodPressureNoCountToHealthScreen 실행");
		return sqlSession.selectOne(NS+"bloodPressureNoCountToHealthScreen",bloodPressureNo);
	}
	
	public int bloodPressureSearchDateCount(Map<String, Object> map) {
		logger.debug("BloodPressureDao - bloodPressureSearchDateCount 실행");
		return sqlSession.selectOne(NS+"bloodPressureSearchDateCount",map);
	}
	
	public List<BloodPressure> bloodPressureSearchDate(Map<String, Object> map) {
		logger.debug("BloodPressureDao - bloodPressureSearchDate 실행");
		return sqlSession.selectList(NS+"bloodPressureSearchDate",map);
	}
			
	public List<BloodPressure> selectBloodPressureChart(String memberNo) {
		logger.debug("BloodPressureDao - selectBlppdPressureChart 실행");
		List<BloodPressure> list = sqlSession.selectList(NS+"bloodPressurechart",memberNo);
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
	
	public int deleteBloodPressure(String bloodPressureNo) {
		logger.debug("BloodPressureDao - deleteBloodPressure 실행");
		return sqlSession.delete(NS+"deleteBloodPressure",bloodPressureNo);
    }
	
	//혈압 리스트
	public List<BloodPressure> bloodPressureList(Map<String,Object> map) {
		logger.debug("BloodPressureDao - bloodPressureList 실행");
		 List<BloodPressure> list = sqlSession.selectList(NS+"bloodPressureList",map);
		return list;
	}
	
	//혈압 리스트 게시글 카운트
	public int bloodPressureCount(Map<String,Object> map) {
		logger.debug("BloodPressureDao - bloodPressureCount 실행");
		return sqlSession.selectOne(NS+"bloodPressureCount",map);
	}
	
	//혈압 번호 선택
	public int selectBloodPressureNo() {
		logger.debug("BloodPressureDao - selectBloodPressureNo 실행");
		int row = sqlSession.selectOne(NS+"bloodPressureNo");
		return row;
	}
	
	//혈압 등록
	public int addBloodPressure(BloodPressure bloodPressure) {
		logger.debug("BloodPressureDao - addBloodPressure 실행");
		int row = sqlSession.insert(NS+"addBloodPressure",bloodPressure);
		return row;
	}
	
}
