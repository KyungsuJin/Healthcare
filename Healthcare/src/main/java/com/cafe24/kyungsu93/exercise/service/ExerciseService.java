package com.cafe24.kyungsu93.exercise.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.kyungsu93.exercise.controller.rest.ExerciseRestController;

@Service
public class ExerciseService {
	@Autowired ExerciseDao exerciseDao;
	private static final Logger logger = LoggerFactory.getLogger(ExerciseService.class);
	//보증금 등록 체크
	public int exerciseDepositChk(String memberNo) {
		logger.debug("ExerciseService.exerciseDepositChk");
		return exerciseDao.exerciseDepositChk(memberNo);
	}
	//보증금 등록 하기
		public int exerciseDepositRegistration(String memberNo) {
			logger.debug("ExerciseService.exerciseDepositRegistration");
			int result=exerciseDao.memberPointChk(memberNo);
			logger.debug("결과 : "+result);
			if(result ==1) {
				Exercise exercise= new Exercise(); 
				int registrationNoLast=(exerciseDao.DepositRegistrationNo())+1;
				String registrationNo = "registration_";
				exercise.setRegistrationNo(registrationNo+registrationNoLast);
				exercise.setMemberNo(memberNo);
				logger.debug(exercise.toString());
				exerciseDao.DepositRegistration(exercise);
			}
			return result;
		}

/*	// 운동선택 리스트
	public int exerciseList(String memberNo) {
		logger.debug("ExerciseService.exerciseList");
		return exerciseDao.exerciseList(memberNo);
	}*/

}
