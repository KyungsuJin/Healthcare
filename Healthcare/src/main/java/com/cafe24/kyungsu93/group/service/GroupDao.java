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
	
	public List<Group> findNameOne(String memberName) {
		logger.debug("GroupDao - findNameOne");
		 List<Group> list = sqlSession.selectList(NS+"findNameOne",memberName);
		return list;
	}
	
	public Group findIdOne(String memberId) {
		logger.debug("GroupDao - findIdOne");
		return sqlSession.selectOne(NS+"findIdOne",memberId);
	}
	
	public int findId(String memberId) {
		logger.debug("GroupDao - findId");
		return sqlSession.selectOne(NS+"findId",memberId);
	}
	
	public int findName(String memberName) {
		logger.debug("GroupDao - findName");
		return sqlSession.selectOne(NS+"findName",memberName);
	}
	
	public int deleteGroup(String groupNo) {
		logger.debug("GroupDao - deleteGroup");
		return sqlSession.delete(NS+"deleteGroup", groupNo);
	}
	
	public List<Group> groupList(Map<String,Integer> map) {
		logger.debug("GroupDao - groupList");
		 List<Group> list = sqlSession.selectList(NS+"groupList",map);
		return list;
	}	
	public int checkGroupName(String groupName) {
		logger.debug("GroupDao - checkGroupName");
		return sqlSession.selectOne(NS+"checkGroupName",groupName);
	}
	
	public int groupTotalCount() {
		logger.debug("GroupDao - groupTotalCount");
		return sqlSession.selectOne(NS+"groupCount");
	}
	
	public int selectGroupNo(String groupNo) {
		logger.debug("GroupDao - selectGroupNo");
		int row = sqlSession.selectOne(NS+"groupNo", groupNo);
		return row;
	}
	public int addGroup(Group Group) {
		logger.debug("GroupDao - addGroup");
		int row = sqlSession.insert(NS+"addGroup", Group);
		return row;
	}
}
	