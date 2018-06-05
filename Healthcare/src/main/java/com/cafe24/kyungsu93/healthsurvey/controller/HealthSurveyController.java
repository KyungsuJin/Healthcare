package com.cafe24.kyungsu93.healthsurvey.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.kyungsu93.healthscreen.service.HealthScreenRequest;
import com.cafe24.kyungsu93.healthsurvey.service.HealthSurveyQuestion;
import com.cafe24.kyungsu93.healthsurvey.service.HealthSurveyRequest;
import com.cafe24.kyungsu93.healthsurvey.service.HealthSurveySelection;
import com.cafe24.kyungsu93.healthsurvey.service.HealthSurveyService;

@Controller
public class HealthSurveyController {
	private static final Logger logger = LoggerFactory.getLogger(HealthSurveyController.class);
	@Autowired HealthSurveyService healthSurveyService;
	
	@RequestMapping(value="/getHealthSurveyList", method=RequestMethod.GET)
	public String getHealthSurveyList(Model model
			,@RequestParam(value="currentPage", defaultValue="1") int currentPage
			,@RequestParam(value="pagePerRow", defaultValue="10") int pagePerRow) {
		logger.debug("HealthSurveyController.getHealthSurveyList 메서드 실행");
		Map map = healthSurveyService.getHealthSurveyList(currentPage, pagePerRow);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("firstPage", map.get("firstPage"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("beforePage", map.get("beforePage"));
		model.addAttribute("afterPage", map.get("afterPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagePerRow", pagePerRow);
		return "getHealthSurveyList";
	}
	
	@RequestMapping(value="/addHealthSurvey", method=RequestMethod.GET)
	public String addHealthSurvey() {
		
		return "addHealthSurvey";
	}
	
	@RequestMapping(value="/addHealthSurvey", method=RequestMethod.POST)
	public String addHealthSurvey(HealthSurveyRequest healthSurveyRequest, HealthSurveyQuestion healthSurveyQuestion, HealthSurveySelection healthSurveySelection) {
		healthSurveyService.addHealthSurvey(healthSurveyRequest, healthSurveyQuestion, healthSurveySelection);
		return "getHealthSurveyList";
	}

}
