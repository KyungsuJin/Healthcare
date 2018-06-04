package com.cafe24.kyungsu93.bloodsugar.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.kyungsu93.bloodsugar.service.BloodsugarService;


@Controller
public class BloodsugarController {
	
	@Autowired
	private BloodsugarService bloodsugarService;
	
	private static final Logger logger = LoggerFactory.getLogger(BloodsugarController.class);
	
	@RequestMapping(value="/bloodsugar/addBloodsugar", method = RequestMethod.GET)
	public String addBloodsugar() {
		System.out.println("addBloodsugar 폼 요청");
		return "/bloodsugar/addBloodsugar";
	}
	
	@RequestMapping(value="/bloodsugar/BloodsugarList", method = RequestMethod.POST)
		public String BloodsugarList() {
			System.out.println("BloodsugarList 폼 요청");
			return "/bloodsugar/BloodsugarList";
	}

}
