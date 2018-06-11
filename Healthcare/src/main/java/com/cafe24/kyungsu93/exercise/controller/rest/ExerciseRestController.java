package com.cafe24.kyungsu93.exercise.controller.rest;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.kyungsu93.exercise.controller.ExerciseController;
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
	//보증금 등록 체크 
	@RequestMapping(value = "/exerciseMatchingList", method = RequestMethod.POST)
	public Map<String,Object> exerciseMatchingList() {
		logger.debug("ExerciseRestController.exerciseMatchingList");
		return exerciseService.exerciseMatchingList();
	}
	//운동 매칭 내용
	@RequestMapping(value = "/exerciseMatchingContent", method = RequestMethod.POST)
	public Map<String,Object> exerciseMatchingContent(@RequestParam(value = "exerciseMatchingNo") String exerciseMatchingNo) {
		logger.debug("ExerciseRestController.exerciseMatchingContent get");
		logger.debug("exerciseMatchingNo : " + exerciseMatchingNo);
		
		return exerciseService.exerciseMatchingContent(exerciseMatchingNo);
	}

}
