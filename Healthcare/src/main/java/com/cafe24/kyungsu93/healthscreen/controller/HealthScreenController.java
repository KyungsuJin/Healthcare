package com.cafe24.kyungsu93.healthscreen.controller;

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

import com.cafe24.kyungsu93.healthscreen.service.HealthScreenRequest;
import com.cafe24.kyungsu93.healthscreen.service.HealthScreenResponse;
import com.cafe24.kyungsu93.healthscreen.service.HealthScreenService;

@Controller
public class HealthScreenController {
	private static final Logger logger = LoggerFactory.getLogger(HealthScreenController.class);
	@Autowired HealthScreenService healthScreenService;
	
	//건강검진표 리스트 출을 위한 메서드
	@RequestMapping(value="/getHealthScreenList", method=RequestMethod.GET)
	public String getHealthScreenList(Model model,HealthScreenRequest healthScreenRequest
													,@RequestParam(value="currentPage", defaultValue="1") int currentPage
													,@RequestParam(value="pagePerRow", defaultValue="10") int pagePerRow
													,HttpSession session) {
		logger.debug("HealthScreenController.getHealthScreenList 메서드 실행");
		if(healthScreenRequest.getMemberNo() != null) {
			Map map = healthScreenService.getHealthScreenList(currentPage, pagePerRow, healthScreenRequest);
			model.addAttribute("list", map.get("list"));
			model.addAttribute("firstPage", map.get("firstPage"));
			model.addAttribute("lastPage", map.get("lastPage"));
			model.addAttribute("beforePage", map.get("beforePage"));
			model.addAttribute("afterPage", map.get("afterPage"));
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("pagePerRow", pagePerRow);
			return "healthscreen/getHealthScreenList";
			
		} if(session.getAttribute("memberSessionNo") != null) {
			healthScreenRequest.setMemberNo(session.getAttribute("memberSessionNo").toString());
			Map map = healthScreenService.getHealthScreenList(currentPage, pagePerRow, healthScreenRequest);
			model.addAttribute("list", map.get("list"));
			model.addAttribute("firstPage", map.get("firstPage"));
			model.addAttribute("lastPage", map.get("lastPage"));
			model.addAttribute("beforePage", map.get("beforePage"));
			model.addAttribute("afterPage", map.get("afterPage"));
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("pagePerRow", pagePerRow);
			return "healthscreen/getHealthScreenList";
		} else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/addHealthScreen", method=RequestMethod.GET)
	public String addHealthScreen() {
		logger.debug("HealthScreenController.addHealthScreen GET 메서드 실행");
		return "healthscreen/addHealthScreen";
	}
	
	@RequestMapping(value="/addHealthScreen", method=RequestMethod.POST)
	public String addHealthScreen(HealthScreenRequest healthScreenRequest) {
		logger.debug("HealthScreenController.addHealthScreen POST 메서드 실행");
		//여기에서 체질량, 혈압, 혈당 모두 매개변수로 받는다. 그런다음 service를 호출한다.
		
		healthScreenService.addHealthScreen(healthScreenRequest);
		
		System.out.println(healthScreenRequest.toString());
		return "redirect:/getHealthScreenList";
	}
	
	@RequestMapping(value="/getHealthScreenResult", method=RequestMethod.GET)
	public String getHealthScreenResult(Model model, HealthScreenRequest healthScreenRequest) {
		HealthScreenResponse healthScreenResponse = healthScreenService.getHealthScreenResult(healthScreenRequest);
		System.out.println("요거다"+healthScreenResponse.toString());
		model.addAttribute("healthScreen", healthScreenResponse);
		return "healthscreen/getHealthScreenResult";
	}
	
	@RequestMapping(value="/removeHealthScreen", method=RequestMethod.GET)
	public String removeHealthScreen(HealthScreenRequest healthScreenRequest) {
		logger.debug("HealthScreenController.removeHealthScreen 메서드 실행");
		healthScreenService.removeHealthScreen(healthScreenRequest);
		return "redirect:/getHealthScreenList";
	}
	
	
	@RequestMapping(value="/modifyHealthScreen", method=RequestMethod.GET)
	public String modifyHealthScreen(Model model
									,HealthScreenRequest healthScreenRequest) {
		logger.debug("HealthScreenController.modifyHealthScreen GET메서드 실행");
		HealthScreenResponse healthScreen = healthScreenService.getHealthScreenOne(healthScreenRequest);
		System.out.println("modify : " + healthScreen);
		model.addAttribute("healthScreen", healthScreen);
		return "healthscreen/modifyHealthScreen";
	}
	
	@RequestMapping(value="/modifyHealthScreen", method=RequestMethod.POST)
	public String modifyHealthScreen(HealthScreenRequest healthScreenRequest) {
		logger.debug("HealthScreenController.modifyHealthScreen POST메서드 실행");
		healthScreenService.modifyHealthScreen(healthScreenRequest);
		return "redirect:/getHealthScreenList";
	}
}
