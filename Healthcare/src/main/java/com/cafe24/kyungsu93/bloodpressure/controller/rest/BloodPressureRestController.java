package com.cafe24.kyungsu93.bloodpressure.controller.rest;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.kyungsu93.bloodpressure.service.BloodPressure;
import com.cafe24.kyungsu93.bloodpressure.service.BloodPressureService;


@RestController
public class BloodPressureRestController {

	@Autowired
	private BloodPressureService bloodPressureService;
	private static final Logger logger = LoggerFactory.getLogger(BloodPressureRestController.class);
	
	 @RequestMapping(value="/bloodPressureChart", method=RequestMethod.POST)
	 @ResponseBody
	 public String chartData(@RequestParam(value="memberNo")String memberNo){
		 logger.debug("BloodPressureRestController - bloodPressureChart chartData ModelAndView 실행");
		List<BloodPressure> list = bloodPressureService.selectBloodPressureChart(memberNo);
		logger.debug("list : " + list);
		logger.debug("memberNo : " + memberNo);
		
		String listSet ="[";
		int num = 0;
		for(BloodPressure bloodPressure : list) {
			listSet +="['";
			listSet += bloodPressure.getBloodPressureDate();
			listSet +="',";
			listSet += bloodPressure.getSystolicPressure();
			listSet +=",";
			listSet += bloodPressure.getDiastolicPressure();
			listSet +="]";
			num ++;
			if(num<list.size()) {
				listSet +=",";
			}
		}
		listSet +="]";
		logger.debug("listSet : " + listSet);
		return listSet;
	}
}
