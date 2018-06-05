package com.cafe24.kyungsu93.disease.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.kyungsu93.disease.service.Disease;
import com.cafe24.kyungsu93.disease.service.DiseaseService;
import com.cafe24.kyungsu93.disease.service.DiseaseSubCategory;



@Controller
public class DiseaseController {
	private static final Logger logger = LoggerFactory.getLogger(DiseaseController.class);
	@Autowired
	DiseaseService diseaseService;
	
	@RequestMapping(value="/addDiseaseSubCategory", method=RequestMethod.POST)
	public String addDiseaseSubCategory(DiseaseSubCategory diseaseSubCategory) {
		logger.debug("DiseaseController_addDiseaseSubCategory_POST");
		diseaseService.addDiseaseSubCategory(diseaseSubCategory);
		return "redirect:/getDiseaseDetail?diseaseNo="+diseaseSubCategory.getDiseaseNo();
	}
	@RequestMapping(value="/addDiseaseSubCategory", method=RequestMethod.GET)
	public String addDiseaseSubCategory(Model model
											,@RequestParam(value="diseaseNo") String diseaseNo) {
		logger.debug("DiseaseController_addDiseaseSubCategory_GET");
		
		model.addAttribute("diseaseNo", diseaseNo);
		return "disease/addDiseaseSubCategory";
	}
	@RequestMapping(value="/getDiseaseDetail", method=RequestMethod.GET)
	public String getDiseaseDetail(Model model
									,@RequestParam(value="diseaseNo") String diseaseNo) {
		logger.debug("DiseaseController_getDiseaseDetail_GET");
		logger.debug("DiseaseController_getDiseaseDetail_GET_diseaseNo : ", diseaseNo);
		List<DiseaseSubCategory> list = diseaseService.getDiseaseDetail(diseaseNo);
		model.addAttribute("list", list);
		model.addAttribute("diseaseNo",diseaseNo);
		return "disease/getDiseaseDetail";
	}
	@RequestMapping(value="/getDiseaseList", method=RequestMethod.GET)
	public String getDiseaseList(Model model) {
		logger.debug("DiseaseController_getDiseaseList");
		List<Disease> list = diseaseService.getDiseaseList();
		model.addAttribute("list", list);
		return "disease/getDiseaseList";
	}
	@RequestMapping(value="/addDisease", method=RequestMethod.POST)
	public String addDisease(Disease disease) {
		logger.debug("DiseaseController_addDisease_POST");
		diseaseService.addDisease(disease);
		return "redirect:/";
	}
	@RequestMapping(value="/addDisease", method=RequestMethod.GET)
	public String addDisease() {
		logger.debug("DiseaseController_addDisease_GET");
		return "disease/addDisease";
	}
}