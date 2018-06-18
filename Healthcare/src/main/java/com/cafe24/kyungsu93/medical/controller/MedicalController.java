package com.cafe24.kyungsu93.medical.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.kyungsu93.medical.service.MedicalService;

@Controller
public class MedicalController {
	
	@Autowired MedicalService medicalService;
	
	@RequestMapping(value="/addMedical", method=RequestMethod.GET)
	public void addMedical() {
		medicalService.addMedical();
	}
}
