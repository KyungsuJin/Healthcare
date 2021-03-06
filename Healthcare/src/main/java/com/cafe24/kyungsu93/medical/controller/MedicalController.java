package com.cafe24.kyungsu93.medical.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping(value="/getMedicalList", method=RequestMethod.GET)
	public String getMedicalList(Model model) {
		model.addAttribute("cityList", medicalService.getCityList());
		return "medical/getMedicalList";
	}
	
	@RequestMapping(value="/getPopMedicalList", method=RequestMethod.GET)
	public String getPopMedicalList(Model model) {
		model.addAttribute("cityList", medicalService.getCityList());
		return "medical/getPopMedicalList";
	}
	@RequestMapping(value="/getPopMedicalMap", method=RequestMethod.GET)
	public String getPopMedicalMap(Model model) {
		return "medical/getPopMedicalMap";
	}
}
