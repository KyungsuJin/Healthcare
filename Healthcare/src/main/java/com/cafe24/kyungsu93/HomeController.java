package com.cafe24.kyungsu93;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@RequestMapping(value = "/resume", method = RequestMethod.GET)
	public String resume() {
		logger.debug("HomeController.resume 메서드 실행");
		return "resume/resume";
	}
	
}
