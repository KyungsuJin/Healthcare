package com.cafe24.kyungsu93.healthsurvey.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class HealthSurveyDao {
	private static final Logger logger = LoggerFactory.getLogger(HealthSurveyDao.class);
	final String NS = "com.cafe24.kyungsu93.healthsurvey.service.HealthSurveyMapper.";
	@Autowired private SqlSessionTemplate sqlSession;
	public int healthSurveyTotalCount() {
		logger.debug("HealthSurveyDao.healthSurveyTotalCount 메서드 실행");
		return sqlSession.selectOne(NS+"healthSurveyTotalCount");
	}
	
	public List<HealthSurveyResponse> getHealthSurveyList(Map<String, Integer> map){
		logger.debug("HealthSurveyDao.getHealthSurveyList 메서드 실행");
		List<HealthSurveyResponse> list = sqlSession.selectList(NS+"getHealthSurveyList", map);
		return list;
	}
	
	public String getHealthSurveyNo() {
		return "health_survey_register_"+sqlSession.selectOne(NS+"getHealthSurveyNo");
	}
	
	public String getHealthSurveyQuestionNo() {
		return "health_survey_question_"+sqlSession.selectOne(NS+"getHealthSurveyQuestionNo");
	}
	
	public String getHealthSurveySelectionNo() {
		return "health_survey_selection_"+sqlSession.selectOne(NS+"getHealthSurveySelectionNo");
	}
	
	public void addHealthSurvey(HealthSurveyRequest healthSurveyRequest) {
		sqlSession.insert(NS+"addHealthSurvey", healthSurveyRequest);
	}
	
	public void addHealthSurveyQuestion(HealthSurveyQuestion healthSurveyQuestion) {
		sqlSession.insert(NS+"addHealthSurveyQuestion", healthSurveyQuestion);
	}
	
	
}