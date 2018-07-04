package com.cafe24.kyungsu93.helper.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.kyungsu93.helper.service.Complain;
import com.cafe24.kyungsu93.helper.service.ComplainAnswer;
import com.cafe24.kyungsu93.helper.service.ComplainRequest;
import com.cafe24.kyungsu93.helper.service.HelperService;
import com.cafe24.kyungsu93.helper.service.Inquire;
import com.cafe24.kyungsu93.helper.service.InquireAnswer;
import com.cafe24.kyungsu93.helper.service.Sanction;



@Controller
public class HelperController {
	private static final Logger logger = LoggerFactory.getLogger(HelperController.class);
	@Autowired
	HelperService helperService;
	
	@RequestMapping(value="/removeSanction", method=RequestMethod.GET)
	public String removeSanction(@RequestParam(value="sanctionNo") String sanctionNo) {
		logger.debug("HelperController_removeSanction");
		helperService.removeSanction(sanctionNo);
		return "redirect:/getAllSanctionList";
	}
	@RequestMapping(value="/getAllSanctionList", method=RequestMethod.GET)
	public String getAllSanctionList(Model model) {
		logger.debug("HelperController_getAllSanctionList");
		List<Sanction> list = helperService.getAllSanctionList();
		model.addAttribute("list", list);
		return "helper/getAllSanctionList";
	}
	@RequestMapping(value="/addSanction", method=RequestMethod.POST)
	public String addSanction(Sanction sanction) {
		logger.debug("HelperController_addSanction_POST");
		helperService.addSanction(sanction);
		return "redirect:/getAllSanctionList";
	}
	@RequestMapping(value="/addSanction", method=RequestMethod.GET)
	public String addSanction() {
		logger.debug("HelperController_addSanction_GET");
		return "helper/addSanction";
	}
	@RequestMapping(value="/removeComplain", method=RequestMethod.GET)
	public String removeComplain(@RequestParam(value="complainNo") String complainNo) {
		logger.debug("HelperController_removeComplain");
		helperService.removeComplain(complainNo);
		return "redirect:/getComplainList";
	}
	@RequestMapping(value="/getComplainAnswer", method=RequestMethod.GET)
	public String getComplainAnswer(Model model
									,@RequestParam(value="complainNo") String complainNo) {
		logger.debug("HelperController_getComplainAnswer");
		model.addAttribute("complainAnswer",helperService.getComplainAnswer(complainNo));
		return "helper/getComplainAnswer";
	}
	@RequestMapping(value="/getAllComplainList", method=RequestMethod.GET)
	public String getAllComplainList(Model model) {
		logger.debug("HelperController_getAllComplainList");
		List<Complain> list = helperService.getAllComplainList();
		model.addAttribute("list", list);
		return "helper/getAllComplainList";
	}
	@RequestMapping(value="/addComplainAnswer", method=RequestMethod.POST)
	public String addComplainAnswer(ComplainAnswer complainAnswer) {
		logger.debug("HelperController_addComplainAnswer_POST");
		helperService.addComplainAnswer(complainAnswer);
		return "redirect:/getAllComplainList";
	}
	@RequestMapping(value="/addComplainAnswer", method=RequestMethod.GET)
	public String addComplainAnswer(Model model
									,@RequestParam(value="complainNo") String complainNo
									,@RequestParam(value="memberNo") String memberNo) {	
		logger.debug("HelperController_addComplainAnswer_GET");
		model.addAttribute("complainNo", complainNo);
		model.addAttribute("memberNo", memberNo);
		return "helper/addComplainAnswer";
	}
	@RequestMapping(value="/getComplainList", method=RequestMethod.GET)
	public String getComplainList(Model model) {
		logger.debug("HelperController_getComplainList");
		List<Complain> list = helperService.getComplainList();
		model.addAttribute("list",list);
		return "helper/getComplainList";
	}
	@RequestMapping(value="/addComplain", method=RequestMethod.POST)
	public String addComplain(ComplainRequest complainRequest, HttpSession session) {
		logger.debug("HelperController_addComplain_POST");
		
		String path = session.getServletContext().getRealPath("resources/upload/");
		helperService.addComplain(complainRequest, path);
		return "redirect:/getComplainList";		
	}
	@RequestMapping(value="/addComplain", method=RequestMethod.GET)
	public String addComplain() {
		logger.debug("HelperController_addComplain_GET");
		return "helper/addComplain";		
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
