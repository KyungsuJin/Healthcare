package com.cafe24.kyungsu93.exercise.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExerciseDao {
	
	@Autowired SqlSessionTemplate sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(ExerciseDao.class);
	final String NS = "com.cafe24.kyungsu93.ExerciseMapper.";
	//보증금 등록 체크
	public int exerciseDepositChk(String memberNo) {
		logger.debug("ExerciseDao.exerciseDepositChk");
		return sqlSession.selectOne(NS+"exerciseDepositChk",memberNo);
	}
	//포인트 천원 이상인지 체크
	public int memberPointChk(String memberNo) {
		logger.debug("ExerciseDao.memberPointChk");
		return sqlSession.selectOne(NS+"memberPointChk",memberNo);
	}
	//보증금 등록 번호
	public int depositRegistrationNo() {
		logger.debug("ExerciseDao.depositRegistrationNo");
		return sqlSession.selectOne(NS+"registrationNo");
	}
	//보증금 등록
	public int depositRegistration(Exercise exercise) {
		logger.debug("ExerciseDao.depositRegistration");
		return sqlSession.insert(NS+"depositRegistration",exercise);
	}
	//보증금 등록으로 인한 포인트 차감
	public void pointDeduction(String memberNo) {
		logger.debug("ExerciseDao.pointDeduction");
		sqlSession.update(NS+"pointDeduction",memberNo);
	}
	//운동매칭 게시글 등록 번호
	public int exerciseMatchingNo() {
		logger.debug("ExerciseDao.exerciseMatchingNo");
		return sqlSession.selectOne(NS + "exerciseMatchingNo");
	}
	//운동매칭 등록
	public void addExercise(ExerciseRegistration exerciseRegistration) {
		logger.debug("ExerciseDao.addExercise");
		sqlSession.insert(NS + "addExercise",exerciseRegistration);
	}
	//운동매칭 리스트
	public List<ExerciseRegistration> exerciseMatchingList() {
		logger.debug("ExerciseDao.exerciseMatchingList");
		return sqlSession.selectList(NS+"exerciseMatchingList");
	}
	//운동매칭 내용 
	public ExerciseRegistration exerciseMatchingContent(String exerciseMatchingNo) {
		logger.debug("ExerciseDao.exerciseMatchingContent");
		return sqlSession.selectOne(NS + "exerciseMatchingContent",exerciseMatchingNo);
	}


}
