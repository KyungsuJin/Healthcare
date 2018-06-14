package com.cafe24.kyungsu93;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	HomeService homeService;
	
	//식품영양정보는 json 으로 받아서 DB에 등록해야 할것같아서 스크립트로 처리하려고함.
	@RequestMapping(value = "/food", method = RequestMethod.GET)
	public String food() {
		logger.debug("HomeController.food 메서드 실행");
		homeService.foodInsert();
		return "food";
	}
	
	@RequestMapping(value = "/resume", method = RequestMethod.GET)
	public String resume() {
		logger.debug("HomeController.resume 메서드 실행");
		return "resume/resume";
	}
	
}
