package com.cafe24.kyungsu93.medication.controller;

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

import com.cafe24.kyungsu93.medication.service.MedicationService;
import com.cafe24.kyungsu93.medication.service.MedicationRequest;

@Controller
public class MedicationController {
	
	private static final Logger logger = LoggerFactory.getLogger(MedicationController.class);
	@Autowired MedicationService medicationService;
	
	@RequestMapping(value="/getMedicationList", method=RequestMethod.GET)
	public String getMedicationList(Model model
									,HttpSession session
									,MedicationRequest medicationRequest
									,@RequestParam(value="currentPage", defaultValue="1" ) int currentPage
									,@RequestParam(value="pagePerRow", defaultValue="10" ) int pagePerRow) {		
		logger.debug("MedicationController.getMedicationList GET 방식 호출");
		medicationRequest.setMemberNo(session.getAttribute("memberSessionNo").toString());
		Map map = medicationService.getMedicationList(currentPage, pagePerRow, medicationRequest);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("firstPage", map.get("firstPage"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("beforePage", map.get("beforePage"));
		model.addAttribute("afterPage", map.get("afterPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagePerRow", pagePerRow);
		return "medication/getMedicationList";
	}
	
	@RequestMapping(value="/addMedication", method=RequestMethod.GET)
	public String addMedication(Model model
			,@RequestParam(value="currentPage", defaultValue="1" ) int currentPage
			,@RequestParam(value="pagePerRow", defaultValue="10" ) int pagePerRow) {
		logger.debug("MedicationController.addMedication GET 방식 호출");
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagePerRow", pagePerRow);
		return "medication/addMedication";
	}
	
	@RequestMapping(value="/addMedication", method=RequestMethod.POST)
	public String addMedication(MedicationRequest medicationRequest, HttpSession session, Model model) {
		logger.debug("MedicationController.addMedication POST 방식 호출");
		medicationRequest.setMemberNo(session.getAttribute("memberSessionNo").toString());
		medicationService.addMedication(medicationRequest);
		return "redirect:/getMedicationList";
	}
	
	@RequestMapping(value="/getMedicationContent", method=RequestMethod.GET)
	public String getMedicationContent(MedicationRequest medicationRequest, Model model
									,@RequestParam(value="currentPage") int currentPage
									,@RequestParam(value="pagePerRow", defaultValue="10" ) int pagePerRow) {
		logger.debug("MedicationController.addMedication POST 방식 호출");
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagePerRow", pagePerRow);
		model.addAttribute("medicationResponse", medicationService.getMedicationContent(medicationRequest));
		return "medication/getMedicationContent";
	}
	
	@RequestMapping(value="/removeMedication", method=RequestMethod.GET)
	public String removeMedication(MedicationRequest medicationRequest
									,@RequestParam(value="currentPage") int currentPage
									,@RequestParam(value="pagePerRow", defaultValue="10" ) int pagePerRow) {
		logger.debug("MedicationController.removeMedication GET 방식 호출");
		medicationService.removeMedication(medicationRequest);
		return "redirect:/getMedicationList";
	}
	
	////////////////////// 게시물 수정 //////////////////////
	
	@RequestMapping(value="/modifyMedication", method=RequestMethod.GET)
	public String modifyMedication(Model model
									,MedicationRequest medicationRequest
									,@RequestParam(value="currentPage") int currentPage
									,@RequestParam(value="pagePerRow", defaultValue="10" ) int pagePerRow) {
		logger.debug("MedicationController.modifyMedication GET 방식 호출");
		model.addAttribute("medicationResponse",medicationService.getMedicationContent(medicationRequest));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagePerRow", pagePerRow);
		return "medication/modifyMedication";
	}
	
	@RequestMapping(value="/modifyMedication", method=RequestMethod.POST)
	public String modifyMedication(Model model
									,HttpSession session
									,MedicationRequest medicationRequest
									,@RequestParam(value="currentPage") int currentPage
									,@RequestParam(value="pagePerRow", defaultValue="10" ) int pagePerRow) {
		logger.debug("MedicationController.modifyMedication POST 방식 호출");
		medicationService.modifyMedication(medicationRequest);
		return "redirect:/getMedicationContent?medicationNo=" + medicationRequest.getMedicationNo() + "&currentPage=" + currentPage + "&pagePerRow=" + pagePerRow;
	}
}
