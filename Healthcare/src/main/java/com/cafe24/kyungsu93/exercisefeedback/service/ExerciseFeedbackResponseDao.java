package com.cafe24.kyungsu93.exercisefeedback.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExerciseFeedbackResponseDao {
	private static final Logger logger = LoggerFactory.getLogger(ExerciseFeedbackResponseDao.class);
	@Autowired
	private SqlSessionTemplate sqlSession;
	final String NS = "com.cafe24.kyungsu93.exercisefeedback.service.ExerciseFeedbackResponseMapper.";
	
	//운동 검색
	public List<ExerciseFeedbackResult> exerciseSearch() {
		logger.debug("ExerciseFeedbackDao - exerciseSearch 실행");
		 List<ExerciseFeedbackResult> list = sqlSession.selectList(NS+"exerciseSearch");
		return list;
	}
	
	//음식 검색
	public List<ExerciseFeedbackResult> foodSearch(Map<String, String> map) {
		logger.debug("ExerciseFeedbackDao - foodSearch 실행");
		 List<ExerciseFeedbackResult> list = sqlSession.selectList(NS+"foodSearch",map);
		return list;
	}
	
}
