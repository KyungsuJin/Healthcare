package com.cafe24.kyungsu93.diet.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.kyungsu93.Food;

@Repository
public class DietDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	String NS = "com.cafe24.kyungsu93.diet.service.DietMapper.";
	Logger logger =	LoggerFactory.getLogger(DietDao.class);
	
	public List<IngestCalorie> getIngestCalorie() {
		logger.debug("DietDao_getIngestCalorie");
		return sqlSession.selectList(NS+"selectIngestCalorieList");
	}
	public int selectIngestCalorieNo() {
		logger.debug("DietDao_selectIngestCalorieNo");
		return sqlSession.selectOne(NS+"selectIngestCalorieNo");
	}
	public int addIngestCalorie(IngestCalorie ingestCalorie) {
		logger.debug("DietDao_ingestCalorie");
		return sqlSession.insert(NS+"insertIngestCalorie", ingestCalorie);
	}
	public List<Food> selectFoodSearch(String sv) {
		logger.debug("DietDao_selectFoodSearch");
		return sqlSession.selectList(NS+"selectFoodSearch", sv);
	}
}
