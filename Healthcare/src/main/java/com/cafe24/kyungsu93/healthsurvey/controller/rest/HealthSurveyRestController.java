package com.cafe24.kyungsu93.healthsurvey.controller.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.kyungsu93.healthsurvey.service.HealthSurveyAverageGrade;
import com.cafe24.kyungsu93.healthsurvey.service.HealthSurveyResultRequest;
import com.cafe24.kyungsu93.healthsurvey.service.HealthSurveyResultResponse;
import com.cafe24.kyungsu93.healthsurvey.service.HealthSurveySelection;
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
	
	@RequestMapping(value="/addHealthSurveyEvaluation", method=RequestMethod.POST)
	public String addHealthSurveyEvaluation(@RequestParam(value="healthSurveyResultNo") String healthSurveyResultNo
											,@RequestParam(value="healthSurveyRegisterNo") String healthSurveyRegisterNo
											,@RequestParam(value="healthSurveyEvaluationAverageGrade") int healthSurveyEvaluationAverageGrade) {
		healthSurveyService.addHealthSurveyEvaluation(healthSurveyResultNo, healthSurveyRegisterNo, healthSurveyEvaluationAverageGrade);
		return "";
	}
	
	@RequestMapping(value="/getHealthSurveyResultSelectionList", method=RequestMethod.POST)
	public Map<String, Object> getHealthSurveyResultSelectionList(HealthSurveyResultRequest healthSurveyResultRequest) {
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(healthSurveyResultRequest.toString());
		List<HealthSurveySelection> list = healthSurveyService.getHealthSurveyResultSelectionList(healthSurveyResultRequest);
		System.out.println("testwnd "+list);
		map.put("list", list);
		return map;

	}
	
}
