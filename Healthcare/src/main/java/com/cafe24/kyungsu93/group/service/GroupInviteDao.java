package com.cafe24.kyungsu93.group.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GroupInviteDao {
	private static final Logger logger = LoggerFactory.getLogger(GroupInviteDao.class);
	@Autowired
	private SqlSessionTemplate sqlSession;
	final String NS = "com.cafe24.kyungsu93.group.service.GroupInviteMapper.";
	
	public int inviteMember(GroupInvite groupInvite) {
		logger.debug("GroupInviteDao - addInviteMember 실행");
		return sqlSession.selectOne(NS+"inviteMember",groupInvite);
	}
	
	public int groupInviteNo(String groupInviteNo) {
		logger.debug("GroupDao - groupInviteNo 실행");
		int row = sqlSession.selectOne(NS+"groupInviteNo", groupInviteNo);
		logger.debug("row:"+row);
		return row;
	}
	
	public int inviteMemberId(String memberId) {
		logger.debug("GroupInviteDao - inviteMemberId 실행");
		return sqlSession.selectOne(NS+"groupInviteMemberId",memberId);
	}
	
	public int totalCountInviteNo() {
		logger.debug("GroupInviteDao - totalCountInviteNo 실행");
		return sqlSession.selectOne(NS+"totalCountInviteNo");
	}
	
	public int totalCountInvite() {
		logger.debug("GroupInviteDao - totalCountInvite 실행");
		return sqlSession.selectOne(NS+"totalCountInvite");
	}
	
	public List<GroupInvite> groupInviteList(Map<String,Integer> map) {
		logger.debug("GroupInviteDao - groupInviteList 실행");
		 List<GroupInvite> list = sqlSession.selectList(NS+"groupInviteList",map);
		return list;
	}	
}