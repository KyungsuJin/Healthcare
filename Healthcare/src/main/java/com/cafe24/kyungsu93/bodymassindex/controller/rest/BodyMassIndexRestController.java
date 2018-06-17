package com.cafe24.kyungsu93.bodymassindex.controller.rest;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.kyungsu93.bodymassindex.controller.BodyMassIndexController;
import com.cafe24.kyungsu93.bodymassindex.service.BodyMassIndex;
import com.cafe24.kyungsu93.bodymassindex.service.BodyMassIndexService;

@RestController
public class BodyMassIndexRestController {
	@Autowired BodyMassIndexService bodyMassIndexService;
	private static final Logger logger = LoggerFactory.getLogger(BodyMassIndexRestController.class);
	
	@RequestMapping(value="/bodyMassIndexChart",method=RequestMethod.POST)
	public List<BodyMassIndex> bodyMassIndexChart(@RequestParam(value="memberNo")String memberNo) {
		logger.debug("BodyMassIndexRestController.bodyMassIndexChart");
		logger.debug("memberNo : "+memberNo);
		List<BodyMassIndex> bodyMassIndexList=bodyMassIndexService.bodyMassIndexChart(memberNo);
		return bodyMassIndexList;
		
	}
	//체질량 삭제
	@RequestMapping(value = "/deleteBmi", method = RequestMethod.POST)
	public int deleteBmi(@RequestParam(value = "bodyMassIndexNo") String bodyMassIndexNo) {
		logger.debug("BodyMassIndexRestController.deleteBmi");
		logger.debug("bodyMassIndexNo" + bodyMassIndexNo);
		int result=bodyMassIndexService.deleteBmi(bodyMassIndexNo);
		return result;
	}

	// 체질량수정전 건강검진표 확인
	@RequestMapping(value = "/healtScreenCount", method = RequestMethod.POST)
	public int healtScreenCount(@RequestParam(value = "bodyMassIndexNo") String bodyMassIndexNo) {
		logger.debug("BodyMassIndexRestController.modifyBmi");
		int result =bodyMassIndexService.healtScreenCount(bodyMassIndexNo);
		return result;
	}

}