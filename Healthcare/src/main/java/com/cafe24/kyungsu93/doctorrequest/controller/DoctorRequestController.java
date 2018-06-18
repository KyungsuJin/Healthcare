package com.cafe24.kyungsu93.doctorrequest.controller;

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
import com.cafe24.kyungsu93.doctorrequest.service.DoctorRequestService;

@Controller
public class DoctorRequestController {
	@Autowired
	private DoctorRequestService doctorRequestService;
	
	private static final Logger logger = LoggerFactory.getLogger(DoctorRequestController.class);
	//일반회원이 자신에게 요청한 의사를 볼 수 있고 제목 내용 등도 같이 보여준다. 요청날짜도 알 수 있다.
	@RequestMapping(value="/DoctorRequestList", method=RequestMethod.GET)
	public String DoctorRequestList(Model model
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage
								,@RequestParam(value="pagePerRow", defaultValue="10")int pagePerRow) {
		logger.debug("DoctorRequestController 에서 DoctorRequestList 실행");
		Map<String,Object> map = doctorRequestService.doctorRequestList(currentPage, pagePerRow);
		logger.debug("1번-1"+map);
		logger.debug("1번"+currentPage);
		logger.debug("2번"+pagePerRow);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastBlockPage", map.get("lastBlockPage"));
		model.addAttribute("firstBlockPage", map.get("firstBlockPage"));
		model.addAttribute("totalBlock", map.get("totalBlock"));
		logger.debug("30번"+map.get("list"));
		return "/doctorrequest/DoctorRequestList";
	}
	
	
	
	
}