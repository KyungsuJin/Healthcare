package com.cafe24.kyungsu93.bloodsugar.service;

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
public class BloodsugarDao {
	private static final Logger logger = LoggerFactory.getLogger(BloodsugarController.class);
	@Autowired
	private SqlSessionTemplate sqlSession;
	final String NS = "com.cafe24.kyungsu93.bloodsugar.service.BloodsugarMapper.";
/*	
	public List<Bloodsugar> searchBloodsugar(Map<String, Object> map){
		logger.debug("BloodsugarDao 에서 search Bloodsugar 실행");
		List<BloodPressure> list = sqlSession.selectList(NS+"searchTable",map);
		return list;
	}*/
	public List<Bloodsugar> bloodsugarList(Map<String,Integer> map) {
		logger.debug("BloodsugarDao 에서 BloodsugarList 실행");
		 List<Bloodsugar> list = sqlSession.selectList(NS+"bloodsugarList",map);
		return list;
	}
	
	public int bloodsugarCount() {
		logger.debug("BloodsugarDao 에서 bloodsugarCount 실행");
		return sqlSession.selectOne(NS+"bloodPressureCount");
	}
	
	public int addBloodsugar(Bloodsugar bloodsugar) {
		
		int row = sqlSession.insert(NS+"addBloodsugar",bloodsugar);
		
		return row;
	}
	
}
