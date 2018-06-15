package com.cafe24.kyungsu93.diet.controller.rest;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.kyungsu93.diet.service.DietService;
import com.cafe24.kyungsu93.diet.service.TotalCalorieResponse;
import com.cafe24.kyungsu93.diet.service.TotalConsumeResponse;
import com.cafe24.kyungsu93.exercise.service.Exercise;
import com.cafe24.kyungsu93.food.service.Food;

@RestController
public class DietRestController {
	private static final Logger logger = LoggerFactory.getLogger(DietRestController.class);
	@Autowired
	DietService dietService;
	
	@RequestMapping(value="/totalConsume", method=RequestMethod.POST)
	public TotalConsumeResponse totoalConsume(@RequestParam(value="memberNo") String memberNo
												,@RequestParam(value="datePicker") String datePicker) {
		logger.debug("DietRestController_totoalConsume");
		TotalConsumeResponse totalConsumeResponse = dietService.totalConsume(memberNo, datePicker);
		System.out.println("12412412413:"+totalConsumeResponse.getTotalExerciseCalorie());
		return totalConsumeResponse;
	}
	@RequestMapping(value="/exerciseSearch", method=RequestMethod.POST)
	public List<Exercise> selectExerciseSearch(@RequestParam(value="sv") String sv) {
		logger.debug("DietRestController_selectExerciseSearch");
		return dietService.selectExerciseSearch(sv);
	}
	@RequestMapping(value="/totalCalorie", method=RequestMethod.POST)
	public TotalCalorieResponse totalCalorie(@RequestParam(value="memberNo") String memberNo
												,@RequestParam(value="datePicker") String datePicker) {
		logger.debug("DietRestController_onedayCalorie");
		TotalCalorieResponse totalCalorie = dietService.totalCalorie(memberNo, datePicker);
		return totalCalorie;
	}
	@RequestMapping(value="/foodSerach", method=RequestMethod.POST)
	public List<Food> selectFoodSearch(Model model
											,@RequestParam(value="sv") String sv) {
		logger.debug("DietRestController_foodSearch");
		List<Food> list = dietService.selectFoodSearch(sv);
		return list;
	}
}
