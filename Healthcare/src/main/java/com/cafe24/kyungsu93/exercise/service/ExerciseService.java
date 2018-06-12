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
	public int addExerciseMatching(ExerciseRegistration exerciseRegistration) {
		logger.debug("ExerciseService.addExerciseMatching");
		int exerciseMatchingNo=(exerciseDao.exerciseMatchingNo())+1;
		int exerciseMatchingJoinMemberNo =(exerciseDao.exerciseMatchingJoinMemberNo())+1;
		String exerciseMatchingStr="exercise_matching_";
		String exerciseMatchingJoinMemberStr = "exercise_matching_join_member_";
		exerciseRegistration.setExerciseMatchingNo(exerciseMatchingStr+exerciseMatchingNo);
		exerciseRegistration.setExerciseMatchingJoinMemberNo(exerciseMatchingJoinMemberStr+exerciseMatchingJoinMemberNo);
		logger.debug(exerciseRegistration.toString());
		exerciseDao.addExerciseMatching(exerciseRegistration);
		exerciseDao.addExerciseMatchingJoinMember(exerciseRegistration);
		
		return 0;
	}
	// 운동매칭 리스트
	public Map<String,Object> exerciseMatchingList(int currentPage,int pagePerRow) {
		logger.debug("ExerciseService.exerciseMatchingList");
		Map<String,Integer> map = new HashMap<String,Integer>();
		int beginRow = (currentPage-1)*10;
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		List<ExerciseRegistration> exerciseMatchingList=exerciseDao.exerciseMatchingList(map);
		int totalCountList =exerciseDao.totalCountList();
		int lastPage=totalCountList/pagePerRow;
		if(totalCountList%pagePerRow>0) {
			lastPage++;
		}
		int startPage=((currentPage-1)/10)*10+1;
		int endPage = startPage+pagePerRow-1;
		if(endPage>lastPage) {
			endPage=lastPage;
		}
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("startPage", startPage);
		returnMap.put("endPage", endPage);
		returnMap.put("lastPage", lastPage);
		returnMap.put("exerciseMatchingList", exerciseMatchingList);
		return returnMap;
	}
	//운동매칭 내용
	public ExerciseRegistration exerciseMatchingContent(String exerciseMatchingNo) {
		logger.debug("ExerciseService.exerciseMatchingContent");
		return exerciseDao.exerciseMatchingContent(exerciseMatchingNo);
	}
	//운동매칭 글 삭제시 글등록자 매칭 참가 신청 삭제
	public void deleteExerciseMatching(String exerciseMatchingNo) {
		logger.debug("ExerciseService.deleteExerciseMatching");
		exerciseDao.deleteExerciseMatching(exerciseMatchingNo);
		exerciseDao.deleteExerciseMatchingJoinMember(exerciseMatchingNo);
	}
	//운동매칭 내용 수정
	public void modifyExerciseMatching(ExerciseRegistration exerciseRegistration) {
		logger.debug("ExerciseService.modifyExerciseMatching");
		exerciseDao.modifyExerciseMatching(exerciseRegistration);
	}
	//운동매칭 참가신청
	public int exerciseSignUp(ExerciseRegistration exerciseRegistration) {
		logger.debug("ExerciseService.exerciseSignUp");
		int exerciseMatchingJoinMemberNo =(exerciseDao.exerciseMatchingJoinMemberNo())+1;
		String exerciseMatchingJoinMemberStr = "exercise_matching_join_member_";
		exerciseRegistration.setExerciseMatchingJoinMemberNo(exerciseMatchingJoinMemberStr+exerciseMatchingJoinMemberNo);
		int result = exerciseDao.exerciseSignUpChk(exerciseRegistration);
		if(result==0) {
		 exerciseDao.addExerciseMatchingJoinMember(exerciseRegistration);
		}
		 return result;
		
	}
	//운동매칭 참가신청 여부
	public int exerciseSignUpSelect(ExerciseRegistration exerciseRegistration) {
		logger.debug("ExerciseService.exerciseSignUpSelect");
		return exerciseDao.exerciseSignUpChk(exerciseRegistration);
	}
	//운동매칭 참가신청 취소
	public void exerciseCancel(ExerciseRegistration exerciseRegistration) {
		logger.debug("ExerciseService.exerciseCancel");
		exerciseDao.exerciseCancel(exerciseRegistration);
	}

}
