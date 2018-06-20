package com.cafe24.kyungsu93.login.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.kyungsu93.member.controller.MemberController;
import com.cafe24.kyungsu93.member.service.Member;

@Service
@Transactional
public class LoginService {
	@Autowired LoginDao loginDao;
	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);
	
	public Map<String,Object> login(Member member) {
		logger.debug("LoginService.login");
		Map<String,Object> map= new HashMap<String,Object>();
		int result=loginDao.login(member);
		logger.debug("---------------------------------------"+result);
		String memberId=member.getMemberId();
		String approvalResult;
		if(result==1) {
			result=1;
			if(loginDao.loginLevel(memberId)==3) {
				approvalResult=loginDao.loginDoctorApproval(memberId);
				logger.debug("asd"+approvalResult);
				if(approvalResult.equals("F")) {
					result=3;
				}else {
					result=1;
				}
			}else if(loginDao.loginLevel(memberId)==4) {
				approvalResult=loginDao.loginTeacherApproval(memberId);
				logger.debug("asd"+approvalResult);
				if(approvalResult.equals("F")) {
					result=3;
				}else {
					result=1;
				}
			}
		}
		if(result==1) {
			Member memberSession=loginDao.loginSession(memberId);
			logger.debug("memberLevel : "+memberSession.getMemberLevel());
			logger.debug("memberName : "+memberSession.getMemberName());
			map.put("memberSessionLevel", memberSession.getMemberLevel());
			map.put("memberSessionName", memberSession.getMemberName());
			map.put("memberSessionNo", memberSession.getMemberNo());
		}
		map.put("result",result);
		logger.debug("result : "+result);
		return map;
	}

}
