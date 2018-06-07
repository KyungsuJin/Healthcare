package com.cafe24.kyungsu93.healthsurvey.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.kyungsu93.healthsurvey.service.HealthSurveyRecord;
import com.cafe24.kyungsu93.healthsurvey.service.HealthSurveyService;

@RestController
public class HealthSurveyRestController {
	
	@Autowired HealthSurveyService healthSurveyService;
	
	@RequestMapping(value="/addHealthSurveyResult", method=RequestMethod.POST)
	public String addHealthSurveyResult(Model model, 
										List<String> healthSurveySelectionNo
										,@RequestParam(value="healthSurveyRegisterNo") int healthSurveyRegisterNo
										,@RequestParam(value="currentPage", defaultValue="1") int currentPage
										) {
		healthSurveyService.addHealthSurveyResult(healthSurveySelectionNo);
		return "healthSurveyResult";
	}
	
}
