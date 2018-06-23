package com.cafe24.kyungsu93.healthsurvey.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.kyungsu93.member.service.Member;


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
	
	public HealthSurveyResponse getHealthSurveyContent(HealthSurveyRequest healthSurveyRequest) {
		return sqlSession.selectOne(NS+"getHealthSurveyContent", healthSurveyRequest);
	}
	
	
	public int getHealthSurveyNo() {
		return sqlSession.selectOne(NS+"getHealthSurveyNo");
	}
	
	public int getHealthSurveyQuestionNo() {
		return sqlSession.selectOne(NS+"getHealthSurveyQuestionNo");
	}
	
	public int getHealthSurveySelectionNo() {
		return sqlSession.selectOne(NS+"getHealthSurveySelectionNo");
	}
	
	public void addHealthSurvey(HealthSurveyRequest healthSurveyRequest) {
		sqlSession.insert(NS+"addHealthSurvey", healthSurveyRequest);
	}
	
	public void addHealthSurveyQuestion(HealthSurveyQuestion healthSurveyQuestion) {
		sqlSession.insert(NS+"addHealthSurveyQuestion", healthSurveyQuestion);
	}
	
	public void addHealthSurveySelection(HealthSurveySelection healthSurveySelection) {
		sqlSession.insert(NS+"addHealthSurveySelection", healthSurveySelection);
	}
	
	public void addHealthSurveyAverageGrade(String healthSurveyRegisterNo) {
		sqlSession.insert(NS+"addHealthSurveyAverageGrade", healthSurveyRegisterNo);
	}
	
	public void removeHealthSurveyAverageGrade(HealthSurveyRequest healthSurveyRequest){
		sqlSession.delete(NS+"removeHealthSurveyAverageGrade", healthSurveyRequest);
	}
	
	public void removeHealthSurveySelection(HealthSurveyQuestion healthSurveyQuestion) {
		sqlSession.delete(NS+"removeHealthSurveySelection", healthSurveyQuestion);
	}
	
	public void removeHealthSurveyQuestion(HealthSurveyRequest healthSurveyRequest) {
		sqlSession.delete(NS+"removeHealthSurveyQuestion", healthSurveyRequest);
	}
	
	public List<HealthSurveyResultRequest> getHealthSurveyResultNoList(HealthSurveyRequest healthSurveyRequest){
		return sqlSession.selectList(NS+"getHealthSurveyResultNoList", healthSurveyRequest);
	}
	
	public void removeHealthSurveyTotalGrade(HealthSurveyResultRequest healthSurveyResultRequest) {
		sqlSession.delete(NS+"removeHealthSurveyTotalGrade", healthSurveyResultRequest);
	}
	
	public void removeHealthSurveyRecord(HealthSurveyResultRequest healthSurveyResultRequest) {
		sqlSession.delete(NS+"removeHealthSurveyRecord", healthSurveyResultRequest);
	}
	
	public void removeHealthSurveyResult(HealthSurveyRequest healthSurveyRequest) {
		sqlSession.delete(NS+"removeHealthSurveyResult", healthSurveyRequest);
	}
	
	public void removeHealthSurvey(HealthSurveyRequest healthSurveyRequest) {
		sqlSession.delete(NS+"removeHealthSurvey", healthSurveyRequest);
	}
	
	public List<HealthSurveyQuestion> getHealthSurveyQuestion(HealthSurveyRequest healthSurveyRequest) {
		return sqlSession.selectList(NS+"getHealthSurveyQuestion", healthSurveyRequest);
	}
	
	public List<HealthSurveyQuestion> getHealthSurveyQuestion(HealthSurveyResultRequest healthSurveyResultRequest) {
		return sqlSession.selectList(NS+"getHealthSurveyQuestionResult", healthSurveyResultRequest);
	}
	
	public List<HealthSurveySelection> getHealthSurveyResultSelectionList(HealthSurveyResultRequest healthSurveyResultRequest) {
		return sqlSession.selectList(NS+"getHealthSurveyResultSelectionList", healthSurveyResultRequest);
	}
	
	public List<HealthSurveySelection> getHealthSurveySelection(HealthSurveyQuestion healthSurveyQuestion) {
		return sqlSession.selectList(NS+"getHealthSurveySelection", healthSurveyQuestion);
	}
	
	public int getHealthSurveyResultNo() {
		return sqlSession.selectOne(NS+"getHealthSurveyResultNo");
	}
	
	public void addHealthSurveyResult(HealthSurveyResultRequest healthSurveyResultRequest) {
		sqlSession.insert(NS+"addHealthSurveyResult", healthSurveyResultRequest);
	}
	
	public void addHealthSurveyRegisterCount(String healthSurveyRegisterNo) {
		sqlSession.update(NS+"addHealthSurveyRegisterCount", healthSurveyRegisterNo);
	}
	
	public void addHealthSurveyTotalGrade(HealthSurveyTotalGrade healthSurveyTotalGrade) {
		sqlSession.insert(NS+"addHealthSurveyTotalGrade", healthSurveyTotalGrade);
	}
	
	public void addHealthSurveyRecord(HealthSurveyRecord healthSurveyRecord) {
		sqlSession.insert(NS+"addHealthSurveyRecord", healthSurveyRecord);
	}
	
	public HealthSurveyResultResponse getHealthSurveyResultOne(HealthSurveyResultRequest healthSurveyResultRequest) {
		return sqlSession.selectOne(NS+"getHealthSurveyResultOne", healthSurveyResultRequest);
	}
	
	public int healthSurveyResultTotalCount(Member member) {
		return sqlSession.selectOne(NS+"healthSurveyResultTotalCount", member);
	}
	
	public List<HealthSurveyResultResponse> getHealthSurveyResultList(Map<String, Object> map){
		logger.debug("HealthSurveyDao.getHealthSurveyResultList 메서드 실행");
		List<HealthSurveyResultResponse> list = sqlSession.selectList(NS+"getHealthSurveyResultList", map);
		return list;
	}
	
	public void addHealthSurveyEvaluation(HealthSurveyResultRequest healthSurveyResultRequest) {
		sqlSession.update(NS+"addHealthSurveyEvaluation", healthSurveyResultRequest);
	}
	
	public void updateHealthSurveyAverageGrade(HealthSurveyAverageGrade healthSurveyAverageGrade) {
		sqlSession.update(NS+"updateHealthSurveyAverageGrade", healthSurveyAverageGrade);
	}
	
}
