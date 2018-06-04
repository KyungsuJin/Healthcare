package com.cafe24.kyungsu93.disease.controller;

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
public class RestDiseaseController {
	private static final Logger logger = LoggerFactory.getLogger(RestDiseaseController.class);
	@Autowired
	DiseaseService diseaseService;
	
	@RequestMapping(value="/diseaseSCNameChecked", method=RequestMethod.POST)
	public String diseaseSubCategoryNameChecked(@RequestParam(value="sendNameChecked") String diseaseSCName) {
		logger.debug("RestDiseaseController_nameCheck", diseaseSCName);
		DiseaseSubCategory diseaseSubcategory = diseaseService.diseaseSubCategoryNameChecked(diseaseSCName); 
		if(diseaseSubcategory.getDiseaseSubCategoryName() != null) {
			System.out.println("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF");
			return "F";
		}
		System.out.println("TTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
		return "T"; // 사용가능하면 T, 불가능하면 F
	}
}
