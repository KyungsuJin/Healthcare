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
	
	public int login(Member member) {
		logger.debug("LoginDao.login");
		return sqlSession.selectOne(NS+"login",member);
		
	}
	public Member loginSession(String id){
		return sqlSession.selectOne(NS+"loginSession",id);
	}
	public int loginLevel(String id) {
		return sqlSession.selectOne(NS+"loginLevel",id);
	}
	public String loginDoctorApproval(String id) {
		return sqlSession.selectOne(NS+"loginDoctorApproval",id);
	}
	public String loginTeacherApproval(String id) {
		return sqlSession.selectOne(NS+"loginTeacherApproval",id);
	}

}
