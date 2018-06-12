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
	
	public List<Food> selectForAddIngetCalorie() {
		logger.debug("DietDao_selectForAddIngetCalorie");
		return sqlSession.selectList(NS+"selectForAddIngestCalorie");
	}
}
