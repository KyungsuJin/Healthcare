package com.cafe24.kyungsu93.helper.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//import com.cafe24.kyungsu93.helper.service.ComplainRequest;

@Controller
public class HelperController {
	private static final Logger logger = LoggerFactory.getLogger(HelperController.class);
	
/*	@RequestMapping(value="/addComplain", method=RequestMethod.POST)
	public String addComplain(ComplainRequest complainRequest) {
		logger.debug("HelperController_addComplain_POST");
		return "";		
	}
	@RequestMapping(value="/addComplain", method=RequestMethod.GET)
	public String addComplain() {
		logger.debug("HelperController_addComplain_GET");
		return "helper/addComplain";		
	}*/
}
