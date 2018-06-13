package com.cafe24.kyungsu93.exercisefeedback.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ExerciseFeedbackDao {

	private static final Logger logger = LoggerFactory.getLogger(ExerciseFeedbackDao.class);
	@Autowired
	private SqlSessionTemplate sqlSession;
	final String NS = "com.cafe24.kyungsu93.exercisefeedback.service.ExerciseFeedbackMapper.";
	
	//운동피드백 요청등록번호 최대값 검색
	public int exerciseFeedbackRequestNo() {
		logger.debug("ExerciseFeedbackDao - exerciseFeedbackRequestNo 실행");
		return sqlSession.selectOne(NS+"exerciseFeedbackRequestNo");
	}
	
	//운동피드백 요청 등록
	public int exerciseFeedbackRequest(ExerciseFeedbackRequest exerciseFeedbackRequest) {
		logger.debug("ExerciseFeedbackDao - exerciseFeedbackRequest 실행");
		int row = sqlSession.insert(NS+"exerciseFeedbackRequest", exerciseFeedbackRequest);
		return row;
	}
	
	//운동피드백 요청 리스트
	public List<ExerciseFeedbackRequest> exerciseFeedbackList(Map<String,Integer> map) {
		logger.debug("ExerciseFeedbackDao - exerciseFeedbackList 실행");
		 List<ExerciseFeedbackRequest> list = sqlSession.selectList(NS+"exerciseFeedbackList",map);
		return list;
	}
	
	//강사 선택
	public ExerciseFeedbackRequest exerciseFeedbackPtSelect(String memberNo) {
		logger.debug("ExerciseFeedbackDao - exerciseFeedbackPtSelect 실행");
		return sqlSession.selectOne(NS+"exerciseFeedbackPtSelect",memberNo);
	}
	
	//강사리스트 전체 검색
	public int exerciseFeedbackPtTotalCount() {
		logger.debug("ExerciseFeedbackDao - exerciseFeedbackPtTotalCount 실행");
		return sqlSession.selectOne(NS+"exerciseFeedbackPtTotalCount");
	}
		
	//강사 리스트
	public List<ExerciseFeedbackRequest> exerciseFeedbackPtList(Map<String,Integer> map) {
		logger.debug("ExerciseFeedbackDao - exerciseFeedbackPtList 실행");
		 List<ExerciseFeedbackRequest> list = sqlSession.selectList(NS+"exerciseFeedbackPtList",map);
		return list;
	}
	
	//운동피드백 요청리스트 전체 검색
	public int exerciseFeedbackRequestTotalCount() {
		logger.debug("ExerciseFeedbackDao - exerciseFeedbackRequestTotalCount 실행");
		return sqlSession.selectOne(NS+"exerciseFeedbackRequestTotalCount");
	}
		
	//운동피드백 요청 리스트
	public List<ExerciseFeedbackRequest> exerciseFeedbackRequestList(Map<String,Integer> map) {
		logger.debug("ExerciseFeedbackDao - exerciseFeedbackRequestList 실행");
		 List<ExerciseFeedbackRequest> list = sqlSession.selectList(NS+"exerciseFeedbackRequestList",map);
		return list;
	}
}

