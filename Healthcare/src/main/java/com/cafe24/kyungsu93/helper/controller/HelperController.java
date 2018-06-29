package com.cafe24.kyungsu93.helper.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.kyungsu93.helper.service.HelperService;
import com.cafe24.kyungsu93.helper.service.Inquire;
import com.cafe24.kyungsu93.helper.service.InquireAnswer;
import com.cafe24.kyungsu93.helper.service.Sanction;



@Controller
public class HelperController {
	private static final Logger logger = LoggerFactory.getLogger(HelperController.class);
	@Autowired
	HelperService helperService;
	
	@RequestMapping(value="/addSanction", method=RequestMethod.POST)
	public String addSanction(Sanction sanction) {
		logger.debug("DoctorFeedbackController_addSanction");
		return "/addSanction";
	}
	@RequestMapping(value="/addSanction", method=RequestMethod.GET)
	public String addSanction() {
		logger.debug("DoctorFeedbackController_addSanction");
		return "helper/addSanction";
	}
	@RequestMapping(value="/removeInquire", method=RequestMethod.GET)
	public String removeInquire(@RequestParam(value="inquireNo") String inquireNo) {
		logger.debug("HelperController_removeInquire");
		helperService.removeInquire(inquireNo);
		return "redirect:/getInquireList";
	}
	@RequestMapping(value="/getInquireAnswer", method=RequestMethod.GET)
	public String getInquireAnswer(Model model
									,@RequestParam(value="inquireNo") String inquireNo) {
		logger.debug("HelperController_getInquireAnswer");
		InquireAnswer inquireAnswer = helperService.getInquireAnswer(inquireNo);
		model.addAttribute("inquireAnswer", inquireAnswer);
		return "helper/getInquireAnswer";
	}
	@RequestMapping(value="/addInquireAnswer", method=RequestMethod.POST)
	public String addInquireAnswer(InquireAnswer inquireAnswer) {
		logger.debug("HelperController_addInquireAnswer_POST");
		helperService.addInquireAnswer(inquireAnswer);
		return "redirect:/getAllInquireList";
	}
	@RequestMapping(value="/addInquireAnswer", method=RequestMethod.GET)
	public String addInquireAnswer(Model model
									,@RequestParam(value="inquireNo") String inquireNo
									,@RequestParam(value="memberNo") String memberNo) {
		logger.debug("HelperController_addInquireAnswer_GET");
		model.addAttribute("inquireNo", inquireNo);
		model.addAttribute("memberNo", memberNo);
		return "helper/addInquireAnswer";
	}
	@RequestMapping(value="/getAllInquireList", method=RequestMethod.GET)
	public String getAllInquireList(Model model) {
		logger.debug("HelperController_getAllInquireList");
		List<Inquire> list = helperService.getAllInquireList();
		model.addAttribute("list", list);
		return "helper/getAllInquireList";
	}
	@RequestMapping(value="/getInquireList", method=RequestMethod.GET)
	public String getInquireList(Model model) {
		logger.debug("HelperController_getInquireList");
		List<Inquire> list = helperService.getInquireList();
		model.addAttribute("list", list);
		return "helper/getInquireList";
	}
	@RequestMapping(value="/addInquire", method=RequestMethod.POST)
	public String addInquire(Inquire inquire) {
		logger.debug("HelperController_addInquire_POST");
		helperService.addInquire(inquire);
		return "redirect:/getInquireList";		
	}
	@RequestMapping(value="/addInquire", method=RequestMethod.GET)
	public String addInquire() {
		logger.debug("HelperController_addInquire_GET");
		return "helper/addInquire";		
	}
}
