package com.cafe24.kyungsu93.exercise.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
				int registrationNoLast=(exerciseDao.depositRegistrationNo())+1;
				String registrationNo = "registration_";
				exercise.setRegistrationNo(registrationNo+registrationNoLast);
				exercise.setMemberNo(memberNo);
				logger.debug(exercise.toString());
				exerciseDao.depositRegistration(exercise);
				exerciseDao.pointDeduction(memberNo);
			}
			return result;
		}

	// 운동매칭 등록
	public int addExercise(ExerciseRegistration exerciseRegistration) {
		logger.debug("ExerciseService.addExercise");
		int exerciseMatchingNo=(exerciseDao.exerciseMatchingNo())+1;
		String exerciseMatchingStr="exercise_matching_";
		exerciseRegistration.setExerciseMatchingNo(exerciseMatchingStr+exerciseMatchingNo);
		logger.debug(exerciseRegistration.toString());
		exerciseDao.addExercise(exerciseRegistration);
		
		return 0;
	}
	// 운동매칭 리스트
	public Map<String,Object> exerciseMatchingList() {
		logger.debug("ExerciseService.exerciseMatchingList");
		List<ExerciseRegistration> exerciseMatchingList=exerciseDao.exerciseMatchingList();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("exerciseMatchingList", exerciseMatchingList);
		return map;
	}
	public Map<String,Object> exerciseMatchingContent(String exerciseMatchingNo) {
		logger.debug("ExerciseService.exerciseMatchingContent");
		ExerciseRegistration exerciseContent=exerciseDao.exerciseMatchingContent(exerciseMatchingNo);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("exerciseContent", exerciseContent);
		return map;
	}

/*	// 운동선택 리스트
	public int exerciseList(String memberNo) {
		logger.debug("ExerciseService.exerciseList");
		return exerciseDao.exerciseList(memberNo);
	}*/

}
