package com.cafe24.kyungsu93.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberFileDao {
	@Autowired SqlSessionTemplate sqlSession;
	
	private static final Logger logger= LoggerFactory.getLogger(MemberFileDao.class);
	final String NS = "com.cafe24.kyungsu93.MemberFileMapper.";
	
	public void memberFile(MemberFile memberFile) {
		logger.debug("MemberFileDao.memberFile");
		sqlSession.insert(NS+"memberFile",memberFile);
	}

}
