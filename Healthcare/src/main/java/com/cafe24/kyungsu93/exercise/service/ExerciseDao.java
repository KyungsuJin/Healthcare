package com.cafe24.kyungsu93.exercise.service;

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
	public int DepositRegistrationNo() {
		logger.debug("ExerciseDao.DepositRegistrationNo");
		return sqlSession.selectOne(NS+"RegistrationNo");
	}
	//보증금 등록
	public int DepositRegistration(Exercise exercise) {
		logger.debug("ExerciseDao.DepositRegistration");
		return sqlSession.insert(NS+"DepositRegistration",exercise);
	}

}
