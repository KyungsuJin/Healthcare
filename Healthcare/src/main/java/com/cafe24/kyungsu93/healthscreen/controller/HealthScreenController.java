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

import com.cafe24.kyungsu93.bloodpressure.service.BloodPressure;
import com.cafe24.kyungsu93.bodymassindex.service.BodyMassIndex;
import com.cafe24.kyungsu93.healthscreen.service.HealthScreenRequest;
import com.cafe24.kyungsu93.healthscreen.service.HealthScreenResponse;
import com.cafe24.kyungsu93.healthscreen.service.HealthScreenService;

@Controller
public class HealthScreenController {
	private static final Logger logger = LoggerFactory.getLogger(HealthScreenController.class);
	@Autowired HealthScreenService healthScreenService;
	
	//건강검진표ㄴ
	@RequestMapping(value="/getHealthScreenList", method=RequestMethod.GET)
	public String getHealthScreenList(Model model,HealthScreenRequest healthScreenRequest
													,@RequestParam(value="currentPage", defaultValue="1") int currentPage
													,@RequestParam(value="pagePerRow", defaultValue="10") int pagePerRow
													,HttpSession session) {
		logger.debug("HealthScreenController.getHealthScreenList 메서드 실행");
		logger.debug("HealthScreenController.getHealthScreenList.memberSessionLevel : " + session.getAttribute("memberSessionLevel"));
		logger.debug("HealthScreenController.getHealthScreenList.currentPage : " + currentPage);
		logger.debug("HealthScreenController.getHealthScreenList.pagePerRow : " + pagePerRow);
		//일반회원인지 아닌지 확인
		if(session.getAttribute("memberSessionLevel") != null && session.getAttribute("memberSessionLevel").toString().equals("2")) {
			//로그인한 회원의 건강검진표만을 가져와야하기때문에 memberNo를 셋팅한다.
			healthScreenRequest.setMemberNo(session.getAttribute("memberSessionNo").toString());
			//리스트를 게시판형태로 출력해야하기 떄문에 currentPage와 pagePerRow를 넘긴다.
			Map map = healthScreenService.getHealthScreenList(currentPage, pagePerRow, healthScreenRequest);
			logger.debug("HealthScreenController.getHealthScreenList.map : " + map);
			//map으로 담아온 데이터를 model에 add한다.
			model.addAttribute("list", map.get("list"));
			model.addAttribute("firstPage", map.get("firstPage"));
			model.addAttribute("lastPage", map.get("lastPage"));
			model.addAttribute("beforePage", map.get("beforePage"));
			model.addAttribute("afterPage", map.get("afterPage"));
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("pagePerRow", pagePerRow);
			return "healthscreen/getHealthScreenList";
		} else { //비회원 및 일반회원이 아닌 경우 메인페이지로 보낸다.
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/addHealthScreen", method=RequestMethod.GET)
	public String addHealthScreen(HttpSession session) {
		logger.debug("HealthScreenController.addHealthScreen GET 메서드 실행");
		if(session.getAttribute("memberSessionLevel").toString().equals("2")) {
			return "healthscreen/addHealthScreen";
		}else {
			return "redirect:/";
		}
	}
	
	//건강검진표 등록을 위한 메서드
	@RequestMapping(value="/addHealthScreen", method=RequestMethod.POST)
	public String addHealthScreen(HealthScreenRequest healthScreenRequest, BodyMassIndex bodyMassIndex, /*BloodSugar bloodSugar,*/ BloodPressure bloodPressure, HttpSession session) {
		logger.debug("HealthScreenController.addHealthScreen POST 메서드 실행");
		if(session.getAttribute("memberSessionLevel").toString().equals("2")) {
			//여기에서 체질량, 혈당, 혈압을 모두 매개변수로 받은뒤, service로 보낸다.
			healthScreenService.addHealthScreen(healthScreenRequest, bodyMassIndex, /*bloodSugar,*/ bloodPressure);		
			logger.debug("HealthScreenController.addHealthScreen.healthSurveyRequest : "+healthScreenRequest.toString());
			return "redirect:/getHealthScreenList";
		}else {
			return "redirect:/";
		}
	}
	
	//건강검진표 결과 출력을 위한 메서드
	@RequestMapping(value="/getHealthScreenResult", method=RequestMethod.GET)
	public String getHealthScreenResult(Model model, HealthScreenRequest healthScreenRequest, HttpSession session) {
		//결과를 보려는 건강검진표의 번호를 healthScreenRequest에 담아 호출한다.
		HealthScreenResponse healthScreenResponse = healthScreenService.getHealthScreenResult(healthScreenRequest);
		if(session.getAttribute("memberSessionNo").toString().equals(healthScreenRequest.getMemberNo())) {
			logger.debug("HealthScreenController.getHealthScreenResult.healthScreenResponse : "+ healthScreenResponse.toString());
			model.addAttribute("healthScreen", healthScreenResponse);
			return "healthscreen/getHealthScreenResult";
		} else {
			return "redirect:/";
		}
	}
	
	//건강검진표 삭제를 위한 메서드
	@RequestMapping(value="/removeHealthScreen", method=RequestMethod.GET)
	public String removeHealthScreen(HealthScreenRequest healthScreenRequest, HttpSession session) {
		if(session.getAttribute("memberSessionNo").toString().equals(healthScreenService.getHealthScreenOne(healthScreenRequest).getMemberNo())) {
			logger.debug("HealthScreenController.removeHealthScreen 메서드 실행");
			//삭제하려는 건강검진표의 번호를 healthScreenRequest에 담아 호출한다.
			healthScreenService.removeHealthScreen(healthScreenRequest);
			return "redirect:/getHealthScreenList";
		} else {
			return "redirect:/";
		}
	}
	
	//건강검진표 수정을 위해 특정 건강검진표의 내용을 가져오는 메서드
	@RequestMapping(value="/modifyHealthScreen", method=RequestMethod.GET)
	public String modifyHealthScreen(Model model, HealthScreenRequest healthScreenRequest, HttpSession session) {
			logger.debug("HealthScreenController.modifyHealthScreen GET메서드 실행");
			//수정하려는 건강검진표의 번호를 healthScreenRequest에 담아 호출한다.
			HealthScreenResponse healthScreen = healthScreenService.getHealthScreenOne(healthScreenRequest);
		if(session.getAttribute("memberSessionNo").toString().equals(healthScreen.getMemberNo())) {
			logger.debug("HealthScreenController.healthScreen : " + healthScreen.toString());
			model.addAttribute("healthScreen", healthScreen);
			return "healthscreen/modifyHealthScreen";
		} else {
			return "redirect:/";
		}
	}
	
	//건강검진표 수정을 위한 메서드
	@RequestMapping(value="/modifyHealthScreen", method=RequestMethod.POST)
	public String modifyHealthScreen(HealthScreenRequest healthScreenRequest) {
		logger.debug("HealthScreenController.modifyHealthScreen POST메서드 실행");
		//삭제하려는 건강검진표의 번호와 내용을 healthScreenRequest에 담아 호출한다.
		healthScreenService.modifyHealthScreen(healthScreenRequest);
		return "redirect:/getHealthScreenList";
	}
}
