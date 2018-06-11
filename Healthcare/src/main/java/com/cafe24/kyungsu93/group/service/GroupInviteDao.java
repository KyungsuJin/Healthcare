package com.cafe24.kyungsu93.group.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class GroupInviteDao {
	private static final Logger logger = LoggerFactory.getLogger(GroupInviteDao.class);
	@Autowired
	private SqlSessionTemplate sqlSession;
	final String NS = "com.cafe24.kyungsu93.group.service.GroupInviteMapper.";
	
	public List<GroupInvite> groupInviteList(Map<String,Integer> map) {
		logger.debug("GroupInviteDao - groupInviteList 실행");
		 List<GroupInvite> list = sqlSession.selectList(NS+"groupInviteList",map);
		return list;
	}	
}
