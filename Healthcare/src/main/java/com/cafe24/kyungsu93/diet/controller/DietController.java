package com.cafe24.kyungsu93.diet.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.kyungsu93.Food;
import com.cafe24.kyungsu93.diet.service.DietService;

@Controller
public class DietController {
	@Autowired
	DietService dietService;
	private static final Logger logger = LoggerFactory.getLogger(DietController.class);
	
	
	@RequestMapping(value="/addIngestCalorie", method=RequestMethod.POST)
	public String addIngestCalorie(String cal) {
		logger.debug("DietController_addIngestCalorie_GET");
		return "redirect:/";
	}
	@RequestMapping(value="/addIngestCalorie", method=RequestMethod.GET)
	public String addIngestCalorie(Model model) {
		logger.debug("DietController_addIngestCalorie_GET");
		List<Food> list = dietService.selectForAddIngetCalorie();
		model.addAttribute("list", list);
		return "diet/addIngestCalorie";
	}
}
