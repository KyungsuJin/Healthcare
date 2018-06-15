package com.cafe24.kyungsu93.diet.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.cafe24.kyungsu93.exercise.service.Exercise;
import com.cafe24.kyungsu93.food.service.Food;

@Repository
public class DietDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	String NS = "com.cafe24.kyungsu93.diet.service.DietMapper.";
	Logger logger =	LoggerFactory.getLogger(DietDao.class);
	
	public int removeConsumeCalorie(String consumeCalorieNo) {
		logger.debug("DietDao_removeConsumeCalorie");
		return sqlSession.delete(NS+"deleteConsumeCalorie", consumeCalorieNo);
	}
	//날짜별 하루 소모칼로리의 토탈을 계산
	public List<TotalConsumeResponse> totalConsume(Map<String, String> map) {
		logger.debug("DietDao_totalConsume");
		return sqlSession.selectList(NS+"selectTotalConsume", map);
	}
	//소모칼로리 리스트를 불러온다.
	public List<ConsumeCalorie> getConsumeCalorie(String memberNo) {
		logger.debug("DietDao_getConsumeCalorie");
		return sqlSession.selectList(NS+"selectConsumeCalorieList", memberNo);
	}
	//검색어를 입력하면 운동 정보를 가져온다
	public List<Exercise> selectExerciseSearch(String sv) {
		logger.debug("DietDao_selectExerciseSearch");
		return sqlSession.selectList(NS+"selectExerciseSearch",sv);
	}
	//소모칼로리의 pk를 생성한다.
	public int selectConsumeCalorieNo() {
		logger.debug("DietDao_selectConsumeCalorieNo");
		return sqlSession.selectOne(NS+"selectConsumeCalorieNo");
	}
	//소모칼로리를 등록한다.
	public int addConsumeCalorie(ConsumeCalorie consumeCalorie) {
		logger.debug("DietDao_addConsumeCalorie");
		return sqlSession.insert(NS+"insertConsumeCalorie", consumeCalorie);
	}
	//날짜별 자신의 하루토탈 칼로리 계산
	public List<TotalCalorieResponse> totalCalorie(Map<String,String> map) {
		logger.debug("DietDao_totalCalorie");
		return sqlSession.selectList(NS+"selectTotalCalorie", map);
	}
	//등록된 섭취칼로리를 삭제한다.
	public int removeIngestCalorie(String ingestCalorieNo) {
		logger.debug("DietDao_removeIngestCalorie");
		return sqlSession.delete(NS+"deleteIngestCalorie", ingestCalorieNo);
	}
	//섭취칼로리 리스트를 불러온다.
	public List<IngestCalorie> getIngestCalorie(String memberNo) {
		logger.debug("DietDao_getIngestCalorie");
		return sqlSession.selectList(NS+"selectIngestCalorieList", memberNo);
	}
	//섭취칼로리의 pk를 생성한다.
	public int selectIngestCalorieNo() {
		logger.debug("DietDao_selectIngestCalorieNo");
		return sqlSession.selectOne(NS+"selectIngestCalorieNo");
	}
	//섭취칼로리를 등록한다.
	public int addIngestCalorie(IngestCalorie ingestCalorie) {
		logger.debug("DietDao_ingestCalorie");
		return sqlSession.insert(NS+"insertIngestCalorie", ingestCalorie);
	}
	//검색어를 입력하면 음식의 정보를 가져온다
	public List<Food> selectFoodSearch(String sv) {
		logger.debug("DietDao_selectFoodSearch");
		return sqlSession.selectList(NS+"selectFoodSearch", sv);
	}
}
