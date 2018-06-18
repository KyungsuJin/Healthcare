package com.cafe24.kyungsu93.medical.controller.rest;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.kyungsu93.medical.service.Medical;
import com.cafe24.kyungsu93.medical.service.MedicalService;

@RestController
public class MedicalRestController {
	
	@Autowired MedicalService medicalService;
	
	@RequestMapping(value="/getMedicalAddressList", method=RequestMethod.POST)
	public Map<String, Object> getMedicalAddressList(Medical medical){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("medicalList", medicalService.getMedicalAddressList(medical));
		System.out.println("map rest : " + map);
		return map;
	}
}
