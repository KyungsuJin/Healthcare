package com.cafe24.kyungsu93.exercise.controller.rest;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.kyungsu93.exercise.controller.ExerciseController;
import com.cafe24.kyungsu93.exercise.service.ExerciseRegistration;
import com.cafe24.kyungsu93.exercise.service.ExerciseService;

@RestController
public class ExerciseRestController {
	@Autowired ExerciseService exerciseService;
	private static final Logger logger = LoggerFactory.getLogger(ExerciseRestController.class);
	
	//보증금 등록 체크 
	@RequestMapping(value="/exerciseDepositChk",method=RequestMethod.GET)
	public int exerciseDepositChk(@RequestParam(value="memberNo")String memberNo) {
		logger.debug("ExerciseRestController.exerciseDepositChk");
		logger.debug("memberNo : " + memberNo );
		int result = exerciseService.exerciseDepositChk(memberNo);
		logger.debug(" 결과 : "+result);
		return result;
	}
	//보증금 등록
	@RequestMapping(value = "/exerciseDepositRegistration1", method = RequestMethod.POST)
	public Map<String,Integer> exerciseDepositRegistration1(@RequestParam(value="memberNo")String memberNo) {
		logger.debug("ExerciseRestController.exerciseDepositRegistration post");
		logger.debug("memberNo : " + memberNo );
		int result = exerciseService.exerciseDepositRegistration(memberNo);
		logger.debug("con 결과 : "+result);
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("result", result);
		return map;
	}
	//운동매칭 리스트
	@RequestMapping(value = "/exerciseMatchingList", method = RequestMethod.POST)
	public Map<String,Object> exerciseMatchingList(@RequestParam(value="currentPage",defaultValue="1")int currentPage
												,@RequestParam(value="pagePerRow",defaultValue="10")int pageRerRow
												,@RequestParam(value = "searchSelect", required = false, defaultValue = "") String searchSelect
												,@RequestParam(value = "searchText", required = false, defaultValue = "") String searchText
												,@RequestParam(value="exerciseDateStart",required=false,defaultValue="")String exerciseDateStart
												,@RequestParam(value="exerciseDateEnd",required=false,defaultValue="")String exerciseDateEnd) {
		logger.debug("ExerciseRestController.exerciseMatchingList");
		logger.debug("searchSelect : " + searchSelect);
		logger.debug("searchText : " + searchText);
		Map<String,Object> map=exerciseService.exerciseMatchingList(currentPage,pageRerRow, searchText,
				searchSelect,exerciseDateStart,exerciseDateEnd);
		map.put("currentPage", currentPage);
		return map;
	}
	//운동매칭 참가 신청
	@RequestMapping(value = "/exerciseSignUp", method = RequestMethod.POST)
	public int exerciseSignUp(ExerciseRegistration exerciseRegistration) {
		logger.debug("ExerciseRestController.exerciseSignUp");
				logger.debug("memberNo : " +exerciseRegistration.getMemberNo() );
				logger.debug("exerciseMatchingNo : " +exerciseRegistration.getExerciseMatchingNo());	
		return exerciseService.exerciseSignUp(exerciseRegistration);
	}
	//운동매칭 참가신청 여부
	@RequestMapping(value = "/exerciseSignUpSelect", method = RequestMethod.POST)
	public int exerciseSignUpSelect(ExerciseRegistration exerciseRegistration) {
		logger.debug("ExerciseRestController.exerciseSignUpSelect");
				logger.debug("memberNo : " +exerciseRegistration.getMemberNo() );
				logger.debug("exerciseMatchingNo : " +exerciseRegistration.getExerciseMatchingNo());	
				return exerciseService.exerciseSignUpSelect(exerciseRegistration);
	}
	//운동매칭 참가 신청 취소
	@RequestMapping(value = "/exerciseCancel", method = RequestMethod.POST)
	public int exerciseCancel(ExerciseRegistration exerciseRegistration) {
		logger.debug("ExerciseRestController.exerciseCancel");
		logger.debug("memberNo : " + exerciseRegistration.getMemberNo());
		logger.debug("exerciseMatchingNo : " + exerciseRegistration.getExerciseMatchingNo());
		exerciseService.exerciseCancel(exerciseRegistration);
		return 1;
	}
	

}
