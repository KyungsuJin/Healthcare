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
	
	public List<Group> deleteGroupList(Map<String,Integer> map) {
		logger.debug("GroupDao - deleteGroupList 실행");
		 List<Group> list = sqlSession.selectList(NS+"deleteGroupList",map);
		return list;
	}
	
	public Group groupDdayNo(String groupExpiredDate) {
		logger.debug("GroupDao - groupDdayNo 실행");
		return sqlSession.selectOne(NS+"groupDdayNo", groupExpiredDate);
	}
		
	public Group groupDdaycheck(Group group) {
		logger.debug("GroupDao - groupDdaycheck 실행");
		return sqlSession.selectOne(NS+"groupDdaycheck", group);
	}
	
	public int groupdeleteCount() {
		logger.debug("GroupDao - groupdeleteCount 실행");
		return sqlSession.selectOne(NS+"groupdeleteCount");
	}
		
	public int deleteApproval(String groupNo) {
		logger.debug("GroupDao - deleteApproval 실행");
		return sqlSession.insert(NS+"deleteApproval", groupNo);
	}
	
	public int deleteGroup(String groupNo) {
		logger.debug("GroupDao - deleteGroup 실행");
		return sqlSession.delete(NS+"deleteGroup", groupNo);
	}
	
	public int modifyGroupResult(Group group) {
		logger.debug("Group - modifyGroupResult 실행");
		return sqlSession.update(NS+"modifyGroupResult",group);
	}
	
	public Group modifyGroup(String groupNo) {
		logger.debug("Group - modifyGroup 실행");
		return sqlSession.selectOne(NS+"modifyGroup",groupNo);
	}
	
	public List<Group> groupList(Map<String,Integer> map) {
		logger.debug("GroupDao - groupList 실행");
		 List<Group> list = sqlSession.selectList(NS+"groupList",map);
		return list;
	}	
	public int checkGroupName(String groupName) {
		logger.debug("GroupDao - checkGroupName 실행");
		return sqlSession.selectOne(NS+"checkGroupName",groupName);
	}
	
	public int groupTotalCount() {
		logger.debug("GroupDao - groupTotalCount 실행");
		return sqlSession.selectOne(NS+"groupCount");
	}
	
	public int selectGroupNo(String groupNo) {
		logger.debug("GroupDao - selectGroupNo 실행");
		int row = sqlSession.selectOne(NS+"groupNo", groupNo);
		logger.debug("row:"+row);
		return row;
	}
	public int addGroup(Group Group) {
		logger.debug("GroupDao - addGroup 실행");
		int row = sqlSession.insert(NS+"addGroup", Group);
		return row;
	}
}
	