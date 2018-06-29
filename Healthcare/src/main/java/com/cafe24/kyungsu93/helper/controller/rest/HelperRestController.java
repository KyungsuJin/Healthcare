package com.cafe24.kyungsu93.helper.controller.rest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.kyungsu93.helper.service.HelperService;

@RestController
public class HelperRestController {
	private static final Logger logger = LoggerFactory.getLogger(HelperRestController.class);
	@Autowired
	HelperService helperService;
	
	@RequestMapping(value="/getSanctionKindList", method=RequestMethod.POST)
	public String getSanctionKindList() {
		logger.debug("DoctorFeedbackController_getSanctionKindList");
		helperService.getSanctionKindList();
		return "T";
	}
}
