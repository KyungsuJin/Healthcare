package com.cafe24.kyungsu93.healthscreen.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.kyungsu93.healthscreen.service.HealthScreen;
import com.cafe24.kyungsu93.healthscreen.service.HealthScreenService;

@Controller
public class HealthScreenController {
	private static final Logger logger = LoggerFactory.getLogger(HealthScreenController.class);
	@Autowired HealthScreenService healthScreenService;
	
	//건강검진표 리스트 출을 위한 메서드
	@RequestMapping(value="/getHealthScreenList", method=RequestMethod.GET)
	public String getHealthScreenList(Model model,HealthScreen healthScreen
													,@RequestParam(value="currentPage", defaultValue="1") int currentPage
													,@RequestParam(value="pagePerRow", defaultValue="10") int pagePerRow) {
		logger.debug("HealthScreenController.getHealthScreenList 메서드 실행");
		Map map = healthScreenService.getHealthScreenList(currentPage, pagePerRow, healthScreen);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("firstPage", map.get("firstPage"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("beforePage", map.get("beforePage"));
		model.addAttribute("afterPage", map.get("afterPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagePerRow", pagePerRow);
		
		return "healthscreen/getHealthScreenList";
	}
	
	@RequestMapping(value="/addHealthScreen", method=RequestMethod.GET)
	public String addHealthScreen() {
		logger.debug("HealthScreenController.addHealthScreen 메서드 실행");
		return "healthscreen/addHealthScreen";
	}
	
	@RequestMapping(value="/addHealthScreen", method=RequestMethod.POST)
	public String addHealthScreen(HealthScreen healthScreen) {
		logger.debug("HealthScreenController.addHealthScreen 메서드 실행");
		
		return "healthscreen/getHealthScreenList";
	}
	
	@RequestMapping(value="/removeHealthScreen", method=RequestMethod.GET)
	public String removeHealthScreen(HealthScreen healthScreen) {
		logger.debug("HealthScreenController.removeHealthScreen 메서드 실행");
		healthScreenService.removeHealthScreen(healthScreen);
		return "healthscreen/getHealthScreenList";
	}
	
	
	@RequestMapping(value="/modifyHealthScreen", method=RequestMethod.GET)
	public String modifyHealthScreen(Model model
									,HealthScreen healthScreen) {
		logger.debug("HealthScreenController.modifyHealthScreen GET메서드 실행");
		healthScreenService.getHealthScreenOne(healthScreen);
		model.addAttribute(healthScreen);
		return "healthscreen/modifyHealthScreen";
	}
	
	@RequestMapping(value="/modifyHealthScreen", method=RequestMethod.POST)
	public String modifyHealthScreen(HealthScreen healthScreen) {
		logger.debug("HealthScreenController.modifyHealthScreen POST메서드 실행");
		healthScreenService.modifyHealthScreen(healthScreen);
		return "healthscreen/getHealthScreenList";
	}
}
