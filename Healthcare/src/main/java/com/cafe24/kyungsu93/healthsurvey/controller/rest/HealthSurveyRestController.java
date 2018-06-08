package com.cafe24.kyungsu93.healthsurvey.controller.rest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.kyungsu93.healthsurvey.service.HealthSurveyService;

@RestController
public class HealthSurveyRestController {
	
	@Autowired HealthSurveyService healthSurveyService;
	
	@RequestMapping(value="/addHealthSurveyResult", method=RequestMethod.POST)
	public String addHealthSurveyResult(Model model, HttpSession session 
										,@RequestParam(value="healthSurveySelectionNo") List<String> healthSurveySelectionNo
										,@RequestParam(value="healthSurveyRegisterNo") String healthSurveyRegisterNo
										,@RequestParam(value="healthSurveyTotalGrade") int healthSurveyTotalGrade) {
		return healthSurveyService.addHealthSurveyResult(session.getAttribute("memberSessionNo").toString(), healthSurveySelectionNo, healthSurveyRegisterNo, healthSurveyTotalGrade);
	}
	
}
