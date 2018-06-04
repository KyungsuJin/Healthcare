package com.cafe24.kyungsu93;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class FoodInfoDao {
	private static final Logger logger = LoggerFactory.getLogger(FoodInfoDao.class);

	final String NS = "com.cafe24.kyungsu93.FoodInfoMapper.";
	
	@Autowired private SqlSessionTemplate sqlSession;
	
	public void foodInfoInsert(FoodInfo foodInfo) {
		logger.debug("FoodInfoDao.foodInfoInsert 메서드 호출");
		sqlSession.insert(NS + "insertFoodInfo", foodInfo);
	}
	
}
