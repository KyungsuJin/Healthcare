package com.cafe24.kyungsu93.bloodsugar.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.cafe24.kyungsu93.bloodsugar.service.Bloodsugar;
import com.cafe24.kyungsu93.bloodsugar.service.BloodsugarService;


@Controller
public class BloodsugarController {
	
	@Autowired
	private BloodsugarService bloodsugarService;
	
	private static final Logger logger = LoggerFactory.getLogger(BloodsugarController.class);
	
	@RequestMapping(value="/addBloodsugar", method = RequestMethod.GET)
	public String addBloodsugar() {
		System.out.println("addBloodsugar 폼 요청");
		return "/bloodsugar/addBloodsugar";
	}
	
	@RequestMapping(value="/addBloodsugar", method = RequestMethod.POST)
		public String BloodsugarList(HttpSession session,Bloodsugar bloodsugar) {
			System.out.println("BloodsugarList 추가 후 List");
			System.out.println("BloodsugarList 추가 후 bloodsugar "+bloodsugar.toString());
			bloodsugarService.addBloodsugar(bloodsugar);
			return "redirect:/BloodsugarList";
	}

	@RequestMapping(value="/BloodsugarList", method=RequestMethod.GET)
	public String bloodsugarList(Model model
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage
								,@RequestParam(value="pagePerRow", defaultValue="10")int pagePerRow) {
		logger.debug("BloodsugarController 에서 BloodsugarList 실행");
		Map<String,Object> map = bloodsugarService.bloodsugarList(currentPage, pagePerRow);
		logger.debug("1번"+currentPage);
		logger.debug("2번"+pagePerRow);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastBlockPage", map.get("lastBlockPage"));
		model.addAttribute("firstBlockPage", map.get("firstBlockPage"));
		model.addAttribute("totalBlock", map.get("totalBlock"));
		return "bloodsugar/BloodsugarList";
	}
	@RequestMapping(value="/modifyBloodsugar", method=RequestMethod.POST)
	public String updateBloodsugar(HttpSession session ,Bloodsugar bloodsugar) {				
		logger.debug("BloodsugarController 에서 updateBloodPressure 리다이렉트 실행");
		logger.debug("---------------------------------1번"+bloodsugar);
		bloodsugarService.updateBloodsugar(bloodsugar);
		return "redirect:/BloodsugarList";
	}
	
	@RequestMapping(value="/modifyBloodsugar", method=RequestMethod.GET)
	public String updateBloodsugarone(Model model
											,@RequestParam(value="bloodsugarno") String bloodsugarno) {
		
		logger.debug("BloodsugarController 에서 updateBloodsugar 포워드 실행 ");
		Bloodsugar bloodsugar = bloodsugarService.selectBloodsugarOne(bloodsugarno);
		model.addAttribute("bloodsugar", bloodsugar);
		logger.debug("bloodsugarController - bloodbloodsugar :"+ bloodsugar);
		logger.debug("+++++++++++++++++988"+bloodsugar);
		return "/bloodsugar/modifyBloodsugar";
	}
	
	@RequestMapping(value="/deleteBloodsugar", method= {RequestMethod.POST,RequestMethod.GET})
	public String deleteBloodsugar(@RequestParam(value="bloodsugarno") String bloodsugarno) {
		logger.debug("BloodsugarController 에서 deleteBloodsugar 리다이렉트 실행.");
		bloodsugarService.deleteBloodsugar(bloodsugarno);
		logger.debug("ddddddddddddddddddddddd"+bloodsugarno);
		return "redirect:/BloodsugarList";
	}
	
	
  /*  public String search(HttpServletRequest request
    						, Model model
				    		,@RequestParam(value="searchCode") String searchType
				    		,@RequestParam(value="searchValue") String searchValue) {
	logger.debug("BloodsugarSearch controller부분실행");
	Map<String,Object> map = bloodsugarService.getSearch(request, model, searchCode, searchValue);
	model.addAttribute("list", map.get("list"));
		return "/bloodsugar/bloodsugarList";
	}*/
}

