package com.cafe24.kyungsu93.bloodsugar.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class BloodsugarController {
	
	private static final Logger logger = LoggerFactory.getLogger(BloodsugarController.class);
	
	@RequestMapping(value="/addBloodsugar", method = RequestMethod.GET)
	public String addBloodsugar() {
		System.out.println("addBloodsugar 폼 요청");
		return "addBloodsugar";
	}
	
	@RequestMapping(value="/BloodsugarList", method = RequestMethod.POST)
		public String BloodsugarList() {
			System.out.println("BloodsugarList 폼 요청");
			return "BloodsugarList";
	}
}

