package com.cafe24.kyungsu93.exercisefeedback.service;

import java.util.List;

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
	
	//운동피드백 요청 등록
	public List<ExerciseFeedbackResult> feedbackFoodSearch(ExerciseFeedbackResult exerciseFeedbackResult) {
		logger.debug("ExerciseFeedbackResponseDao - feedbackFoodSearch 실행");
		List<ExerciseFeedbackResult> list = sqlSession.selectList(NS+"feedbackFoodSearch", exerciseFeedbackResult);
		return list;
	}
}
