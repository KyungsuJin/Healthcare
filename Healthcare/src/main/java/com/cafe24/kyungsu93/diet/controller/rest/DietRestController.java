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

import com.cafe24.kyungsu93.Food;
import com.cafe24.kyungsu93.diet.service.DietService;
import com.cafe24.kyungsu93.diet.service.TotalCalorieResponse;

@RestController
public class DietRestController {
	private static final Logger logger = LoggerFactory.getLogger(DietRestController.class);
	@Autowired
	DietService dietService;
	
	@RequestMapping(value="/totalCalorie", method=RequestMethod.POST)
	public TotalCalorieResponse totalCalorie(Model model
												,@RequestParam(value="memberNo") String memberNo
												,@RequestParam(value="datePicker") String datePicker) {
		logger.debug("DietRestController_onedayCalorie");
		TotalCalorieResponse totalCalorie = dietService.totalCalorie(memberNo, datePicker);
		model.addAttribute("totalCalorie", totalCalorie);
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
