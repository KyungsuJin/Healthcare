package com.cafe24.kyungsu93.food.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class FoodDao {
	private static final Logger logger = LoggerFactory.getLogger(FoodDao.class);

	final String NS = "com.cafe24.kyungsu93.food.service.FoodMapper.";
	
	@Autowired private SqlSessionTemplate sqlSession;
	
	public void addFood(Food food) {
		logger.debug("FoodDao.addFood 메서드 호출");
		sqlSession.insert(NS + "addFood", food);
	}
}
