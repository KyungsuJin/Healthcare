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

import com.cafe24.kyungsu93.diet.service.BodyMassIndexResponse;
import com.cafe24.kyungsu93.diet.service.CalorieBattle;
import com.cafe24.kyungsu93.diet.service.ConsumeCalorie;
import com.cafe24.kyungsu93.diet.service.ConsumeCalorieRequest;
import com.cafe24.kyungsu93.diet.service.DietService;
import com.cafe24.kyungsu93.diet.service.IngestCalorie;
import com.cafe24.kyungsu93.diet.service.IngestCalorieRequest;

@Controller
public class DietController {
	@Autowired
	DietService dietService;
	private static final Logger logger = LoggerFactory.getLogger(DietController.class);
	
	@RequestMapping(value="/getCalorieInfo", method=RequestMethod.GET)
	public String getCalorieBattleInfo(Model model, String memberNo) {
		logger.debug("DietController_getCalorieInfo");
		CalorieBattle calorieBattle = dietService.getCalorieInfo(memberNo);
		model.addAttribute("calorieBattle", calorieBattle);
		System.out.println(calorieBattle.getCalorieBattleNo());
		System.out.println(calorieBattle.getCarbohydrate());
		return "diet/getCalorieInfo";
	}
	@RequestMapping(value="/getCalorieBattleRankList", method=RequestMethod.GET)
	public String getCalorieBattleRankleList(Model model
										,@RequestParam(value="memberId", defaultValue="null") String memberId) {
		logger.debug("getCalorieBattleRankList");
		List<BodyMassIndexResponse> list = dietService.getCalorieBattleRankList(memberId);	
		model.addAttribute("list", list);
		return "diet/getCalorieBattleRankList";
	}
	@RequestMapping(value="/addCalorieBattle", method=RequestMethod.GET)
	public String addCalorieBattle() {
		logger.debug("DietController_addCalorieBattle_GET");
		return "diet/addCalorieBattle";
	}
	@RequestMapping(value="/removeConsumeCalorie", method=RequestMethod.GET)
	public String removeConsumeCalorie(@RequestParam(value="consumeCalorieNo") String consumeCalorieNo
										,@RequestParam(value="memberNo") String memberNo) {
		logger.debug("DietController_removeConsumeCalorie");
		dietService.removeConsumeCalorie(consumeCalorieNo, memberNo);
		return "redirect:/getConsumeCalorie";
	}
	@RequestMapping(value="/getConsumeCalorie", method=RequestMethod.GET)
	public String getConsumeCalorie(Model model) {
		logger.debug("DietController_getConsumeCalorie");
		List<ConsumeCalorie> list = dietService.getConsumeCalorie();
		model.addAttribute("list", list);
		return "diet/getConsumeCalorie";
	}
	@RequestMapping(value="/addConsumeCalorie", method=RequestMethod.POST)
	public String addConsumeCalorie(ConsumeCalorieRequest consumeCalorieRequest) {
		logger.debug("DietController_addConsumeCalorie_POST");
		dietService.addConsumeCalorie(consumeCalorieRequest);
		return "/";
	}
	@RequestMapping(value="/addConsumeCalorie", method=RequestMethod.GET)
	public String addConsumeCalorie() {
		logger.debug("DietController_addConsumeCalorie_GET");
		return "diet/addConsumeCalorie";
	}
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