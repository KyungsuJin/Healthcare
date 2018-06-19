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

	//멤버 이름 검색
	public GroupInvite memberNameSearch(String groupName) {
		logger.debug("GroupInviteDao - memberNameSearch 실행");
		return sqlSession.selectOne(NS+"memberNameSearch",groupName);
	}	

	//그룹 초대 수락
	public int acceptGroupList(GroupInvite groupInvite) {
		logger.debug("GroupInviteDao - acceptGroupList 실행");
		int row = sqlSession.insert(NS+"acceptGroupList",groupInvite);
		return row;
	}	
	
	//그룹 회원리스트 카운트
	public int groupMemberListCount(String groupName) {
		logger.debug("GroupInviteDao - groupMemberListCount 실행");
		return sqlSession.selectOne(NS+"groupMembersListCount",groupName);
	}		
	
	//그룹 회원 리스트
	public List<GroupInvite> groupMemberList(Map<String, Object> map) {
		logger.debug("GroupInviteDao - groupMemberList 실행");
		 List<GroupInvite> list = sqlSession.selectList(NS+"groupMembersList",map);
		return list;
	}
	
	//그룹초대리스트
	public List<GroupInvite> inviteGroupList(Map<String,Integer> map) {
		logger.debug("GroupInviteDao - inviteGroupList 실행");
		 List<GroupInvite> list = sqlSession.selectList(NS+"inviteGroupList",map);
		return list;
	}	
	
	public GroupInvite personalAgreeSearch(String memberNo) {
		logger.debug("GroupInviteDao - personalAgreeSearch 실행");
		return sqlSession.selectOne(NS+"personalAgreeSearch",memberNo);
	}
	
	public int inviteMember(GroupInvite groupInvite) {
		logger.debug("GroupInviteDao - addInviteMember 실행");
		return sqlSession.insert(NS+"inviteMember",groupInvite);
	}
	
	public int groupInviteNo(String groupInviteNo) {
		logger.debug("GroupInviteDao - groupInviteNo 실행");
		int row = sqlSession.selectOne(NS+"groupInviteNo", groupInviteNo);
		logger.debug("row:"+row);
		return row;
	}
	
	public GroupInvite groupInviteMemberName(String memberId) {
		logger.debug("GroupInviteDao - groupInviteMemberName 실행");
		return sqlSession.selectOne(NS+"groupInviteMemberName",memberId);
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
