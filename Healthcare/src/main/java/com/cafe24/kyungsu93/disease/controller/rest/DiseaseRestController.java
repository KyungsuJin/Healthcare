package com.cafe24.kyungsu93.disease.controller.rest;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.kyungsu93.disease.service.DiseaseService;
import com.cafe24.kyungsu93.disease.service.DiseaseSubCategory;

@RestController
public class DiseaseRestController {
	private static final Logger logger = LoggerFactory.getLogger(DiseaseRestController.class);
	@Autowired
	DiseaseService diseaseService;
	
	@RequestMapping(value="/selectBoxDisease", method=RequestMethod.POST)
	public List<DiseaseSubCategory> selectBoxDisease(@RequestParam(value="diseaseNo") String diseaseNo) {
		logger.debug("RestDiseaseController_selectBoxDisease", diseaseNo);
		List<DiseaseSubCategory> list = diseaseService.selectBoxDisease(diseaseNo);
		System.out.println("llllllllllllllllllllllllllllll"+list.size());
		return list;
	}
	@RequestMapping(value="/diseaseSCNameChecked", method=RequestMethod.POST)
	public String diseaseSubCategoryNameChecked(@RequestParam(value="sendNameChecked") String diseaseSCName) {
		logger.debug("RestDiseaseController_nameCheck", diseaseSCName);
		int result = diseaseService.diseaseSubCategoryNameChecked(diseaseSCName);
		return String.valueOf(result); // 사용가능하면 T, 불가능하면 F
	}
}
