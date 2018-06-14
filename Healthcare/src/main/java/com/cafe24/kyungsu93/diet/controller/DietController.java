package com.cafe24.kyungsu93.diet.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.kyungsu93.diet.service.DietService;
import com.cafe24.kyungsu93.diet.service.IngestCalorie;
import com.cafe24.kyungsu93.diet.service.IngestCalorieRequest;

@Controller
public class DietController {
	@Autowired
	DietService dietService;
	private static final Logger logger = LoggerFactory.getLogger(DietController.class);
	
	@RequestMapping(value="/removeIngestCalorie", method=RequestMethod.GET)
	public String removeIngestCalorie(@RequestParam(value="ingestCalorieNo") String ingestCalorieNo
										,@RequestParam(value="memberNo") String memberNo) {
		logger.debug("DietController_removeIngestCalorie");
		dietService.removeIngestCalorie(ingestCalorieNo, memberNo);
		return "redirect:/getIngestCalorie";
	}
	@RequestMapping(value="/myCalorie", method=RequestMethod.GET)
	public String myCalorie() {
		logger.debug("DietController_myCalorie");
		return "diet/myCalorie";
	}
	@RequestMapping(value="/getIngestCalorie", method=RequestMethod.GET)
	public String getIngestCalorie(Model model) {
		logger.debug("DietController_getIngestCalorie");
		List<IngestCalorie> list = dietService.getIngestCalorie();
		model.addAttribute("list", list);
		System.out.println("memberNo : ~~~"+list.get(1).getMemberNo());
		return "diet/getIngestCalorie";
	}
	@RequestMapping(value="/addIngestCalorie", method=RequestMethod.POST)
	public String addIngestCalorie(IngestCalorieRequest ingestCalorieRequest) {
		logger.debug("DietController_addIngestCalorie_POST");
		dietService.addIngestCalorie(ingestCalorieRequest);
		return "redirect:/";
	}
	@RequestMapping(value="/addIngestCalorie", method=RequestMethod.GET)
	public String addIngestCalorie() {
		logger.debug("DietController_addIngestCalorie_GET");
		return "diet/addIngestCalorie";
	}
}