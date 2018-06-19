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
	
	//건강설문 리스트 출력을 위한 메서드
	@RequestMapping(value="/getHealthSurveyList", method=RequestMethod.GET)
	public String getHealthSurveyList(Model model
			,@RequestParam(value="currentPage", defaultValue="1") int currentPage
			,@RequestParam(value="pagePerRow", defaultValue="10") int pagePerRow
			,HttpSession session) {
		logger.debug("HealthSurveyController.getHealthSurveyList 메서드 실행");
		if(session.getAttribute("memberSessionLevel") != null) {
			Map map = healthSurveyService.getHealthSurveyList(currentPage, pagePerRow);
			model.addAttribute("list", map.get("list"));
			model.addAttribute("firstPage", map.get("firstPage"));
			model.addAttribute("lastPage", map.get("lastPage"));
			model.addAttribute("beforePage", map.get("beforePage"));
			model.addAttribute("afterPage", map.get("afterPage"));
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("pagePerRow", pagePerRow);
			return "healthsurvey/getHealthSurveyList";
		} else {
			return "redirect:/";
		}
	}
	
	//건강설문 내용 출력을 위한 메서드
	@RequestMapping(value="getHealthSurveyContent", method=RequestMethod.GET)
	public String getHealthSurveyContent(Model model, HealthSurveyRequest healthSurveyRequest, HttpSession session) {
		if(session.getAttribute("memberSessionLevel") != null) {
			HealthSurveyResponse healthSurveyResponse = healthSurveyService.getHealthSurveyContent(healthSurveyRequest);
			model.addAttribute("healthSurveyContent", healthSurveyResponse);
			return "healthsurvey/getHealthSurveyContent";
		} else {
			return "redirect:/";
		}
	}
	
	//건강설문 등록을 위한 메서드
	@RequestMapping(value="/addHealthSurvey", method=RequestMethod.GET)
	public String addHealthSurvey(Model model, HttpSession session) {
		if(session.getAttribute("memberSessionLevel").toString().equals("3")) {
			//건강설문 등록전 특정 질병에 대한 설문이라는것을 선택해야하기때문에 질병 리스트를 가져온다.
			List<Disease> list = healthSurveyService.selectListForAdd();
			model.addAttribute("list", list);
			return "healthsurvey/addHealthSurvey";
		} else {
			return "redirect:/getHealthSurveyList";
		}
	}
	
	//건강설문 등록을 위한 메서드
	@RequestMapping(value="/addHealthSurvey", method=RequestMethod.POST)
	public String addHealthSurvey(HealthSurveyRequest healthSurveyRequest, HealthSurveyQuestion healthSurveyQuestion, HealthSurveySelection healthSurveySelection, HttpSession session) {
		if(session.getAttribute("memberSessionLevel").toString().equals("3")) {
			healthSurveyService.addHealthSurvey(healthSurveyRequest, healthSurveyQuestion, healthSurveySelection);
		}
		return "redirect:/getHealthSurveyList";
	}
	
	//특정 설문의 질문내용과 선택지를 가져오기 위한 메서드
	@RequestMapping(value="/getHealthSurveyQuestion", method=RequestMethod.GET)
	public String getHealthSurveyQuestion(Model model, HealthSurveyRequest healthSurveyRequest, HttpSession session) {
		if(session.getAttribute("memberSessionLevel") != null) {
			Map<String, Object> map = healthSurveyService.getHealthSurveyQuestion(healthSurveyRequest);
			for(String name : map.keySet()) {
				model.addAttribute(name, map.get(name));
			}
			return "healthsurvey/addHealthSurveyResult";
		} else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/removeHealthSurvey", method=RequestMethod.GET)
	public String removeHealthSurvey(HealthSurveyRequest healthSurveyRequest, HttpSession session) {
		if(session.getAttribute("memberSessionLevel").toString().equals("1")) {
			healthSurveyService.removeHealthSurvey(healthSurveyRequest);
		}
		return "redirect:/getHealthSurveyList";
	}
	
	@RequestMapping(value="/getHealthSurveyResult", method=RequestMethod.GET)
	public String getHealthSurveyResult(Model model, HealthSurveyResultRequest healthSurveyResultRequest, HttpSession session) {
		String memberSessionLevel = session.getAttribute("memberSessionLevel").toString();
		if(memberSessionLevel.equals("2") || memberSessionLevel.equals("3")) {
			HealthSurveyResultResponse healthSurveyResultResponse = healthSurveyService.getHealthSurveyResultOne(healthSurveyResultRequest);
			model.addAttribute("healthSurveyResultResponse", healthSurveyResultResponse);
			return "healthsurvey/getHealthSurveyResult";
		} else {
			return "redirect:/";
		}
		
		
	}
	
	@RequestMapping(value="/getHealthSurveyResultList", method=RequestMethod.GET)
	public String getHealthSurveyResultList(Model model, HttpSession session
											,@RequestParam(value="currentPage", defaultValue="1") int currentPage
											,@RequestParam(value="pagePerRow", defaultValue="10") int pagePerRow
											,Member member) {
		if(session.getAttribute("memberSessionLevel") != null && session.getAttribute("memberSessionLevel").toString().equals("2")) {
			member.setMemberNo(session.getAttribute("memberSessionNo").toString());
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
		} else {
			return "redirect:/";
		}

	}

}
