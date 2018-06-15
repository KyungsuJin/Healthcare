/*package com.cafe24.kyungsu93.doctorrequest.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.kyungsu93.bloodsugar.controller.BloodsugarController;
import com.cafe24.kyungsu93.doctorrequest.service.DoctorRequestService;

@Controller
public class DoctorRequestController {
	@Autowired
	private DoctorRequestService doctorRequestService;
	
	private static final Logger logger = LoggerFactory.getLogger(DoctorRequestController.class);
	
	@RequestMapping(value="/doctorrequest", method = RequestMethod.GET)
	public String doctorrequestList(Model model,@RequestParam(value="currentPage", defaultValue="1") int currentPage
												,@RequestParam(value="pagePerRow", defaultValue="10")int pagePerRow) {
	logger.debug("DoctorrequestController 에서 DoctorrequestList 실행");
	Map<String,Object> map = doctorRequestService.doctorRequestList(currentPage, pagePerRow);
	logger.debug("1번"+map);
	model.addAttribute("lastPage", map.get("lastPage"));
	model.addAttribute("currentPage", currentPage);
	model.addAttribute("list", map.get("list"));
	model.addAttribute("lastBlockPage", map.get("lastBlockPage"));
	model.addAttribute("firstBlockPage", map.get("firstBlockPage"));
	model.addAttribute("totalBlock", map.get("totalBlock"));
	return "doctorrequest/DoctorRequestList";
	}
}*/