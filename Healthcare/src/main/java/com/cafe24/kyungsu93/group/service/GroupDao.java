package com.cafe24.kyungsu93.group.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GroupDao{
	private static final Logger logger = LoggerFactory.getLogger(GroupDao.class);
	@Autowired
	private SqlSessionTemplate sqlSession;
	final String NS = "com.cafe24.kyungsu93.group.service.GroupMapper.";
	
	public int deleteGroup(String groupNo) {
		logger.debug("GroupDao - deleteGroup �떎�뻾");
		return sqlSession.delete(NS+"deleteGroup", groupNo);
	}
	
	public List<Group> groupList(Map<String,Integer> map) {
		logger.debug("GroupDao - groupList �떎�뻾");
		 List<Group> list = sqlSession.selectList(NS+"groupList",map);
		return list;
	}	
	public int checkGroupName(String groupName) {
		logger.debug("GroupDao - checkGroupName �떎�뻾");
		return sqlSession.selectOne(NS+"checkGroupName",groupName);
	}
	
	public int groupTotalCount() {
		logger.debug("GroupDao - groupTotalCount �떎�뻾");
		return sqlSession.selectOne(NS+"groupCount");
	}
	
	public int selectGroupNo(String groupNo) {
		logger.debug("GroupDao - selectGroupNo �떎�뻾");
		int row = sqlSession.selectOne(NS+"groupNo", groupNo);
		return row;
	}
	public int addGroup(Group Group) {
		logger.debug("GroupDao - addGroup �떎�뻾");
		int row = sqlSession.insert(NS+"addGroup", Group);
		return row;
	}
}
	