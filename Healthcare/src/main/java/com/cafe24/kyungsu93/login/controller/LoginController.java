package com.cafe24.kyungsu93.login.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.kyungsu93.login.service.LoginService;
import com.cafe24.kyungsu93.member.service.Member;

@Controller
public class LoginController {
	@Autowired LoginService loginService;
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login() {
		return "login/login";
	}
	@ResponseBody
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public int login(Member member,HttpSession session) {
		logger.debug("ID:"+member.getMemberId());
		logger.debug("PW"+member.getMemberPw());
		Map<String,Object> result=loginService.login(member);
		int i=(Integer)(result.get("result"));
		logger.debug("resutl = "+i);
		if(i==1) {
			logger.debug("asdfasdf : "+result.get("memberSessionLevel"));
			session.setAttribute("result", result.get("result"));
			session.setAttribute("memberId", member.getMemberId());
			session.setAttribute("memberLevel", result.get("memberSessionLevel"));
			session.setAttribute("memberSessionName", result.get("memberSessionName"));
		}else {
			logger.debug("login fail");
		}
		return i;
	}
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.debug("LoginController.logout GET");
		session.invalidate();
		return "index";
	}

}
