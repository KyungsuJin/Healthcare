package com.cafe24.kyungsu93.bloodpressure.controller.rest;

import java.util.List;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.kyungsu93.bloodpressure.service.BloodPressure;
import com.cafe24.kyungsu93.bloodpressure.service.BloodPressureService;


@RestController
public class BloodPressureRestController {

	@Autowired
	private BloodPressureService bloodPressureService;
	private static final Logger logger = LoggerFactory.getLogger(BloodPressureRestController.class);
	
	 @RequestMapping(value="/bloodPressureChart", method=RequestMethod.POST)
	public List<BloodPressure> chartData(@RequestParam(value="memberNo")String memberNo){
		 logger.debug("BloodPressureRestController - bloodPressureChart chartData ajax 실행");
		
		List<BloodPressure> list = bloodPressureService.selectBloodPressureChart(memberNo);

		logger.debug("list : " + list);
		logger.debug("memberNo : " + memberNo);
		return list;
		
	}
}
