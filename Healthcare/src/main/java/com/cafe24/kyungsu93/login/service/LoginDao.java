package com.cafe24.kyungsu93.login.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.kyungsu93.member.service.Member;

@Repository
public class LoginDao {
	@Autowired SqlSessionTemplate sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(LoginDao.class);
	final String NS = "com.cafe24.kyungsu93.LoginMapper.";
	
	//로그인시 아이디 비번확인
	public int login(Member member) {
		logger.debug("LoginDao.login");
		return sqlSession.selectOne(NS+"login",member);
		
	}
	//로그인시 세션
	public Member loginSession(String id){
		logger.debug("LoginDao.loginSession");
		return sqlSession.selectOne(NS+"loginSession",id);
	}
	//로그인 레벨
	public int loginLevel(String id) {
		logger.debug("LoginDao.loginLevel");
		return sqlSession.selectOne(NS+"loginLevel",id);
	}
	//의사회원의 승인여부 파악
	public String loginDoctorApproval(String id) {
		logger.debug("LoginDao.loginDoctorApproval");
		return sqlSession.selectOne(NS+"loginDoctorApproval",id);
	}
	//pt회원의 승인여부 파악
	public String loginTeacherApproval(String id) {
		logger.debug("LoginDao.loginTeacherApproval");
		return sqlSession.selectOne(NS+"loginTeacherApproval",id);
	}

}
