package com.cafe24.kyungsu93;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class FoodDao {
	private static final Logger logger = LoggerFactory.getLogger(FoodDao.class);

	final String NS = "com.cafe24.kyungsu93.FoodMapper.";
	
	@Autowired private SqlSessionTemplate sqlSession;
	
	public void foodInsert(Food food) {
		logger.debug("FoodDao.foodInsert 메서드 호출");
		sqlSession.insert(NS + "insertFood", food);
	}
	
}
