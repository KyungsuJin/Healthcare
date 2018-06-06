package com.cafe24.kyungsu93.login.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.kyungsu93.member.controller.MemberController;
import com.cafe24.kyungsu93.member.service.Member;

@Service
public class LoginService {
	@Autowired LoginDao loginDao;
	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);
	
	//로그인 
	public Map<String,Object> login(Member member) {
		logger.debug("LoginService.login");
		Map<String,Object> map= new HashMap<String,Object>();
		int result=loginDao.login(member);// 아이디 비번이 있나 확인 없으면 0 있으면 1
		logger.debug("---------------------------------------"+result);
		String memberId=member.getMemberId();
		String approvalResult;
		if(result==1) {//아이디 비밀번호가 존재하면
			result=1;
			if(loginDao.loginLevel(memberId)==3) {//로그인했을시 해당아이디의  레벨이 3이면
				approvalResult=loginDao.loginDoctorApproval(memberId);//승인여부를 확인
				logger.debug("asd"+approvalResult);
				if(approvalResult.equals("F")) {//승인여부가 F : false
					result=3;//로그인 실패
				}else {
					result=1;//로그인 성공
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
		if(result==1) {//세션처리
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
