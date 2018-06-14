package com.cafe24.kyungsu93.bodymassindex.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.kyungsu93.bloodsugar.controller.BloodsugarController;
import com.cafe24.kyungsu93.bodymassindex.service.BodyMassIndex;
import com.cafe24.kyungsu93.bodymassindex.service.BodyMassIndexService;

@Controller
public class BodyMassIndexController {
	@Autowired BodyMassIndexService bodyMassIndexService;
	private static final Logger logger = LoggerFactory.getLogger(BodyMassIndexController.class);
	//체질량 입력 페이지
	@RequestMapping(value="/addBodyMassIndex",method=RequestMethod.GET)
	public String addBodyMassIndex() {
		logger.debug("BodyMassIndexController.addBodyMassIndex GET");
		return "bodymassindex/addBodyMassIndex";
	}
	//체질량 입력완료후 등록
	@RequestMapping(value="/addBodyMassIndex",method=RequestMethod.POST)
	public String addBodyMassIndex(BodyMassIndex bodyMassIndex) {
		logger.debug("BodyMassIndexController.addBodyMassIndex POST");
		logger.debug(bodyMassIndex.toString());
		bodyMassIndexService.addBodyMassIndex(bodyMassIndex);
		return "redirect:/addBodyMassIndex";
	}
	//체질량 입력 페이지
	@RequestMapping(value = "/bodyMassIndexList", method = RequestMethod.GET)
	public String bodyMassIndexList(Model model
									,@RequestParam(value="memberNo")String memberNo) {
		logger.debug("BodyMassIndexController.bodyMassIndexList GET");
		List<BodyMassIndex> bodyMassIndexList =bodyMassIndexService.bodyMassIndexList(memberNo);
		model.addAttribute("bodyMassIndexList",bodyMassIndexList);
		return "bodymassindex/bodyMassIndexList";
	}
	//체질량 차트 페이지
	@RequestMapping(value = "/bodyMassIndexChart", method = RequestMethod.GET)
	public String bodyMassIndexChart() {
		logger.debug("BodyMassIndexController.bodyMassIndexChart GET");
		return "bodymassindex/bodyMassIndexChart";
	}


}
