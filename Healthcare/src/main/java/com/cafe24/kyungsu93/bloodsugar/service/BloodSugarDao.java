/*package com.cafe24.kyungsu93.bloodsugar.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.kyungsu93.bloodpressure.service.BloodPressure;
import com.cafe24.kyungsu93.bloodsugar.controller.BloodsugarController;

@Repository
public class BloodSugarDao {
	private static final Logger logger = LoggerFactory.getLogger(BloodsugarController.class);
	@Autowired
	private SqlSessionTemplate sqlSession;
	final String NS = "com.cafe24.kyungsu93.bloodsugar.service.BloodsugarMapper.";
	
	public List<Bloodsugar> searchBloodsugar(Map<String, Object> map){
		logger.debug("BloodsugarDao 에서 search Bloodsugar 실행");
		List<BloodPressure> list = sqlSession.selectList(NS+"searchTable",map);
		return list;
	}
	public List<BloodSugar> bloodsugarList(Map<String,Integer> map) {
		logger.debug("BloodsugarDao 에서 BloodsugarList 실행");
		logger.debug("6번"+map);
		return sqlSession.selectList(NS+"bloodsugarList",map);
	}
	
	public int bloodsugarCount() {
		logger.debug("BloodsugarDao 에서 bloodsugarCount 실행");
		return sqlSession.selectOne(NS+"bloodsugarCount");
	}
	
	public int addBloodsugar(BloodSugar bloodsugar) {
	
		
		int row = sqlSession.insert(NS+"addBloodsugar",bloodsugar);
		
		return row;
	}
	
	public int updateBloodsugar(BloodSugar bloodsugar) {
		logger.debug("BloodsugarDao 에서 updateBloodsugar 실행------------------3번"+bloodsugar);
		return sqlSession.update(NS+"updateBloodsugar",bloodsugar);
    }
	
	public BloodSugar selectBloodsugarOne(String bloodsugarno) {
		logger.debug("BloodsugarDao 에서 selectBloodsugarOne 실행"+bloodsugarno);
		return sqlSession.selectOne(NS+"BloodsugarOne",bloodsugarno);
	}
	
	public int deletesugarCount(String bloodsugarno) {
		logger.debug("BloodPressureDao 에서 deletePressureCount 실행");
		return sqlSession.delete(NS+"deleteBloodsugar",bloodsugarno);
	}
	public List<Bloodsugar> selectBloodsugarChart(String memeberno) {
		logger.debug("BloodsugarDao 에서 selectBloodsugarChart 실행");
		List<Bloodsugar> list = sqlSession.selectList(NS+"bloodsugarchart",memeberno);
		return list;
	}
	
}
*/

package com.cafe24.kyungsu93.bloodsugar.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.kyungsu93.bloodpressure.service.BloodPressure;

@Repository
public class BloodSugarDao {
	private static final Logger logger = LoggerFactory.getLogger(BloodSugarDao.class);
	@Autowired
	private SqlSessionTemplate sqlSession;
	final String NS = "com.cafe24.kyungsu93.bloodsugar.service.BloodSugarMapper.";

	public List<BloodSugar> bloodSugarList(Map<String,Integer> map) {
		logger.debug("BloodSugarDao - BloodSugarList 실행");
		List<BloodSugar> list = sqlSession.selectList(NS+"bloodSugarList",map);
		return list;
	}
	
	public int bloodSugarCount() {
		logger.debug("BloodSugarDao - bloodSugarCount 실행");
		return sqlSession.selectOne(NS+"bloodSugarCount");
	}
	
	public int addBloodSugar(BloodSugar bloodSugar) {
		logger.debug("BloodSugarDao 에서 addBloodSugar 실행");	
		int row = sqlSession.insert(NS+"addBloodSugar",bloodSugar);
		return row;
	}
	
	public int updateBloodSugar(BloodSugar bloodSugar) {
		logger.debug("BloodSugarDao 에서 updateBloodSugar 실행");
		return sqlSession.update(NS+"updateBloodSugar",bloodSugar);
    }
	
	public BloodSugar selectBloodSugarOne(String bloodSugarNo) {
		logger.debug("BloodSugarDao 에서 selectBloodSugarOne 실행");
		return sqlSession.selectOne(NS+"bloodSugarOne",bloodSugarNo);
	}
	
	public int deleteSugarCount(String bloodSugarNo) {
		logger.debug("BloodPressureDao 에서 deletePressureCount실행");
		return sqlSession.delete(NS+"deleteBloodSugar",bloodSugarNo);
	}
	public int selectBloodSugarNo() {
		logger.debug("BloodSugarDao - selectBloodSugarNo 실행");
		int row = sqlSession.selectOne(NS+"bloodSugarNo");
		return row;
	}
	
	public int bloodSugarNoCountToHealthScreen(String bloodSugareNo) {
		logger.debug("BloodPressureDao - bloodPressureNoCountToHealthScreen 실행");
		return sqlSession.selectOne(NS+"bloodSugarNoCountToHealthScreen",bloodSugareNo);
	}
	public List<BloodSugar> selectBloodSugarChart(String memberNo) {
		logger.debug("BloodPressureDao - selectBlppdPressureChart 실행");
		List<BloodSugar> list = sqlSession.selectList(NS+"bloodSugarchart",memberNo);
		return list;
	}
}
