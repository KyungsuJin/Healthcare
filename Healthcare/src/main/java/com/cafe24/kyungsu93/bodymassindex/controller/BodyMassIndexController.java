package com.cafe24.kyungsu93.bodymassindex.controller;

import java.util.List;
import java.util.Map;

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
	public String addBodyMassIndex(Model model,BodyMassIndex bodyMassIndex) {
		logger.debug("BodyMassIndexController.addBodyMassIndex POST");
		logger.debug(bodyMassIndex.toString());
		bodyMassIndexService.addBodyMassIndex(bodyMassIndex);
		model.addAttribute("memberNo",bodyMassIndex.getMemberNo());
		return "redirect:/bodyMassIndexList";
	}
	//체질량 리스트 페이지
	@RequestMapping(value = "/bodyMassIndexList", method = RequestMethod.GET)
	public String bodyMassIndexList(Model model
									,@RequestParam(value="memberNo")String memberNo
									,@RequestParam(value="currentPage",defaultValue="1")int currentPage
									,@RequestParam(value="pageRerRow",defaultValue="10")int pagePerRow
									,@RequestParam(value="bodyMassIndexDateStart",defaultValue="")String bodyMassIndexDateStart
									,@RequestParam(value="bodyMassIndexDateEnd",defaultValue="")String bodyMassIndexDateEnd) {
		logger.debug("BodyMassIndexController.bodyMassIndexList GET");
		Map<String,Object> bodyMassIndexList =bodyMassIndexService.bodyMassIndexList(memberNo,currentPage,pagePerRow,bodyMassIndexDateStart,bodyMassIndexDateEnd);
		model.addAttribute("bodyMassIndexList",bodyMassIndexList.get("list"));
		model.addAttribute("startPage",bodyMassIndexList.get("startPage"));
		model.addAttribute("endPage",bodyMassIndexList.get("endPage"));
		model.addAttribute("lastPage",bodyMassIndexList.get("lastPage"));
		model.addAttribute("currentPage",currentPage);
		return "bodymassindex/bodyMassIndexList";
	}
	//체질량 차트 페이지
	@RequestMapping(value = "/bodyMassIndexChart", method = RequestMethod.GET)
	public String bodyMassIndexChart() {
		logger.debug("BodyMassIndexController.bodyMassIndexChart GET");
		return "bodymassindex/bodyMassIndexChart";
	}
	// 체질량 수정 폼
	@RequestMapping(value = "/modifyBmi", method = RequestMethod.GET)
	public String modifyBmi(Model model,@RequestParam(value = "bodyMassIndexNo") String bodyMassIndexNo) {
		logger.debug("BodyMassIndexRestController.modifyBmi GET");
		logger.debug("bodyMassIndexNo"+bodyMassIndexNo);
		BodyMassIndex bodyMassIndex=bodyMassIndexService.modifyBmiInfo(bodyMassIndexNo);
		model.addAttribute("bodyMassIndex",bodyMassIndex);
		return "bodymassindex/modifyBodyMassIndex";
	}
	// 체질량 수정 
	@RequestMapping(value = "/modifyBmi", method = RequestMethod.POST)
	public String modifyBmi(Model model,BodyMassIndex bodyMassIndex) {
		logger.debug("BodyMassIndexRestController.modifyBmi POST");
		bodyMassIndexService.modifyBmi(bodyMassIndex);
		model.addAttribute("memberNo",bodyMassIndex.getMemberNo());
		return "redirect:/bodyMassIndexList";
	}
	


}
