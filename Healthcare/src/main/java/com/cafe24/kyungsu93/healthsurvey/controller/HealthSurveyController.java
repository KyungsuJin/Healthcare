package com.cafe24.kyungsu93.healthsurvey.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.kyungsu93.disease.service.Disease;
import com.cafe24.kyungsu93.healthsurvey.service.HealthSurveyQuestion;
import com.cafe24.kyungsu93.healthsurvey.service.HealthSurveyRequest;
import com.cafe24.kyungsu93.healthsurvey.service.HealthSurveyResponse;
import com.cafe24.kyungsu93.healthsurvey.service.HealthSurveyResultRequest;
import com.cafe24.kyungsu93.healthsurvey.service.HealthSurveyResultResponse;
import com.cafe24.kyungsu93.healthsurvey.service.HealthSurveySelection;
import com.cafe24.kyungsu93.healthsurvey.service.HealthSurveyService;
import com.cafe24.kyungsu93.member.service.Member;

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
		return "healthsurvey/getHealthSurveyList";
	}
	
	@RequestMapping(value="getHealthSurveyContent", method=RequestMethod.GET)
	public String getHealthSurveyContent(Model model, HealthSurveyRequest healthSurveyRequest) {
		HealthSurveyResponse healthSurveyResponse = healthSurveyService.getHealthSurveyContent(healthSurveyRequest);
		model.addAttribute("healthSurveyContent", healthSurveyResponse);
		return "healthsurvey/getHealthSurveyContent";
	}
	
	@RequestMapping(value="/addHealthSurvey", method=RequestMethod.GET)
	public String addHealthSurvey(Model model) {
		List<Disease> list = healthSurveyService.selectListForAdd();
		model.addAttribute("list", list);
		return "healthsurvey/addHealthSurvey";
	}
	
	@RequestMapping(value="/addHealthSurvey", method=RequestMethod.POST)
	public String addHealthSurvey(HealthSurveyRequest healthSurveyRequest, HealthSurveyQuestion healthSurveyQuestion, HealthSurveySelection healthSurveySelection) {
		System.out.println("여기오---------------");
		System.out.println(healthSurveyRequest.toString());
		System.out.println(healthSurveyQuestion.toString());
		System.out.println(healthSurveySelection.toString());
		System.out.println("여기오---------------");
		healthSurveyService.addHealthSurvey(healthSurveyRequest, healthSurveyQuestion, healthSurveySelection);
		return "redirect:/getHealthSurveyList";
	}
	
	@RequestMapping(value="/getHealthSurveyQuestion", method=RequestMethod.GET)
	public String addHealthSurveyResult(Model model, HealthSurveyRequest healthSurveyRequest) {
		System.out.println(healthSurveyRequest.toString());
		Map<String, Object> map = healthSurveyService.getHealthSurveyQuestion(healthSurveyRequest);
		for(String name : map.keySet()) {
			model.addAttribute(name, map.get(name));
			System.out.println("1 : " + name);
			System.out.println("2 : " + map.get(name));
		}
		
		return "healthsurvey/addHealthSurveyResult";
	}
	
	@RequestMapping(value="/removeHealthSurvey", method=RequestMethod.GET)
	public String addHealthSurveyResult(HealthSurveyRequest healthSurveyRequest) {
		healthSurveyService.removeHealthSurvey(healthSurveyRequest);
		return "redirect:/getHealthSurveyList";
	}
	
	@RequestMapping(value="/getHealthSurveyResult", method=RequestMethod.GET)
	public String getHealthSurveyResult(Model model, HealthSurveyResultRequest healthSurveyResultRequest) {
		System.out.println("11111"+healthSurveyResultRequest.toString());
		HealthSurveyResultResponse healthSurveyResultResponse = healthSurveyService.getHealthSurveyResultOne(healthSurveyResultRequest);
		model.addAttribute("healthSurveyResultResponse", healthSurveyResultResponse);
		System.out.println("22222"+healthSurveyResultResponse.toString());
		
		return "healthsurvey/getHealthSurveyResult";
	}
	
	@RequestMapping(value="/getHealthSurveyResultList", method=RequestMethod.GET)
	public String getHealthSurveyResultList(Model model, HttpSession session
			,@RequestParam(value="currentPage", defaultValue="1") int currentPage
			,@RequestParam(value="pagePerRow", defaultValue="10") int pagePerRow
			,Member member) {
		if(member.getMemberNo() == null) {
			if(session.getAttribute("memberSessionNo") != null) {
				member.setMemberNo(session.getAttribute("memberSessionNo").toString());
			} else {
				return "redirect:/";
			}
			
		}
		logger.debug("HealthSurveyController.getHealthSurveyResultList 메서드 실행");
		Map map = healthSurveyService.getHealthSurveyResultList(currentPage, pagePerRow, member);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("firstPage", map.get("firstPage"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("beforePage", map.get("beforePage"));
		model.addAttribute("afterPage", map.get("afterPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagePerRow", pagePerRow);
		return "healthsurvey/getHealthSurveyResultList";
	}

}
