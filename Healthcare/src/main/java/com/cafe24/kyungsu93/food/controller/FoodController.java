package com.cafe24.kyungsu93.food.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.kyungsu93.food.service.FoodService;


public class FoodController {
	private static final Logger logger = LoggerFactory.getLogger(FoodController.class);
	@Autowired FoodService foodService;
	//식품영양정보는 json 으로 받아서 DB에 등록해야 할것같아서 스크립트로 처리하려고함.
	@RequestMapping(value = "/addFood", method = RequestMethod.GET)
	public String addFood() {
		logger.debug("HomeController.food 메서드 실행");
		foodService.addFood();
		return "addFood";
	}
}
