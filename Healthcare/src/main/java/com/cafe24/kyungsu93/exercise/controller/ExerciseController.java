package com.cafe24.kyungsu93.exercise.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.kyungsu93.exercise.service.ExerciseRegistration;
import com.cafe24.kyungsu93.exercise.service.ExerciseService;
import com.cafe24.kyungsu93.message.controller.rest.MessageRestController;

@Controller
public class ExerciseController {
	@Autowired ExerciseService exerciseService;
	private static final Logger logger = LoggerFactory.getLogger(ExerciseController.class);
	//보증금 등록 폼
	@RequestMapping(value="/exerciseDepositRegistration",method=RequestMethod.GET)
	public String exerciseDepositRegistration() {
		logger.debug("ExerciseRestController.exerciseDepositRegistration get");
		return "exercise/exerciseDepositRegistration";
	}
	//운동매칭 페이지
	@RequestMapping(value="/exerciseMatching",method=RequestMethod.GET)
	public String exerciseMatching() {
		logger.debug("ExerciseRestController.exerciseMatching get");
		return "exercise/exerciseMatching";
	}
	//운동매칭 등록 페이지
	@RequestMapping(value="/addExercise",method=RequestMethod.GET)
	public String addExercise() {
		logger.debug("ExerciseRestController.addExercise get");
		return "exercise/addExercise";
	}
	//운동매칭 등록 
	@RequestMapping(value = "/addExercise", method = RequestMethod.POST)
	public String addExercise(ExerciseRegistration exerciseRegistration) {
		logger.debug("ExerciseRestController.addExercise POST");
		logger.debug(exerciseRegistration.toString());
		exerciseService.addExercise(exerciseRegistration);
		return "redirect:/exerciseMatching";
	}
	//운동 장소 선택
	@RequestMapping(value = "/exercisePlace", method = RequestMethod.GET)
	public String exercisePlace() {
		logger.debug("ExerciseRestController.exercisePlace get");
		return "exercise/exercisePlace";
	}
	//운동 장소 리스트 뷰
	@RequestMapping(value = "/exercisePlaceView", method = RequestMethod.GET)
	public String exercisePlaceView() {
		logger.debug("ExerciseRestController.exercisePlaceView get");
		return "exercise/exercisePlaceView";
	}
	
	
}
