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

	//가입된 그룹 체크 카운트
	public int memberGroupCreateCheckCount(String memberNo) {
		logger.debug("GroupInviteDao - memberGroupCreateCheckCount 실행");
		return sqlSession.selectOne(NS+"memberGroupCreateCheckCount",memberNo);
	}
	
	//가입된 그룹 체크
	public List<Group> memberGroupCreateCheck(String memberNo) {
		logger.debug("GroupInviteDao - memberGroupCreateCheck 실행");
		return sqlSession.selectList(NS+"memberGroupCreateCheck",memberNo);
	}
	
	//그룹이름검색
	public Group groupNameSearch(String groupNo) {
		logger.debug("GroupInviteDao - groupNameSearch 실행");
		return sqlSession.selectOne(NS+"groupNameSearch",groupNo);
	}	
	
	//그룹 번호 검색
	public Group groupNoSearch(String groupName) {
		logger.debug("GroupDao - groupNoSearch 실행");
		return sqlSession.selectOne(NS+"groupNoSearch",groupName);
	}
	
	//그룹 상세 이전글 카운트
	public int prevGroupDetailCount(String groupNo) {
		logger.debug("GroupDao - prevGroupDetailCount 실행");
		return sqlSession.selectOne(NS+"prevGroupDetailCount",groupNo);
	}		
	
	//그룹 상세 다음글 카운트
	public int nextGroupCount(String groupNo) {
		logger.debug("GroupDao - nextGroupCount 실행");
		return sqlSession.selectOne(NS+"nextGroupCount",groupNo);
	}		
	
	//그룹 상세 다음글 
	public Group nextGroupDetail(String groupNo) {
		logger.debug("GroupDao - nextGroupDetail 실행");
		return sqlSession.selectOne(NS+"nextGroupDetail",groupNo);
	}
	
	//그룹 상세 이전글
	public Group prevGroupDetail(String groupNo) {
		logger.debug("GroupDao - prevGroupDetail 실행");
		return sqlSession.selectOne(NS+"prevGroupDetail",groupNo);
	}
	
	public List<Group> deleteGroupList(Map<String,Integer> map) {
		logger.debug("GroupDao - deleteGroupList 실행");
		 List<Group> list = sqlSession.selectList(NS+"deleteGroupList",map);
		return list;
	}
	
	public int groupDeleteCheckMemberCount(String groupName) {
		logger.debug("GroupDao - groupDeleteCheckMemberCount 실행");
		return sqlSession.selectOne(NS+"groupDeleteCheckMemberCount",groupName);
	}
	
	public Group groupDdayNo(String groupExpiredDate) {
		logger.debug("GroupDao - groupDdayNo 실행");
		return sqlSession.selectOne(NS+"groupDdayNo", groupExpiredDate);
	}
	
	public Group groupDeleteCheckgroupNo(String groupNo) {
		logger.debug("GroupDao - groupDeleteCheckgroupNo 실행");
		return sqlSession.selectOne(NS+"groupDeleteCheckgroupName", groupNo);
	}
		
	public Group groupDdaycheck() {
		logger.debug("GroupDao - groupDdaycheck 실행");
		return sqlSession.selectOne(NS+"groupDdaycheck");
	}
	
	public int groupdeleteCount() {
		logger.debug("GroupDao - groupdeleteCount 실행");
		return sqlSession.selectOne(NS+"groupdeleteCount");
	}
		
	public int deleteApproval(String groupNo) {
		logger.debug("GroupDao - deleteApproval 실행");
		return sqlSession.insert(NS+"deleteApproval", groupNo);
	}
	
	public int deleteGroupDelete(String groupNo) {
		logger.debug("GroupDao - deleteGroupDelete 실행");
		return sqlSession.delete(NS+"deleteGroupDelete", groupNo);
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
	
	public int checkGroupNoCount(String memberNo) {
		logger.debug("GroupDao - checkGroupNoCount 실행");
		return sqlSession.selectOne(NS+"checkGroupNoCount",memberNo);
	}
	
	public int checkGroupNameCount(String groupName) {
		logger.debug("GroupDao - checkGroupNameCount 실행");
		return sqlSession.selectOne(NS+"checkGroupNameCount",groupName);
	}
	
	public int groupTotalCount() {
		logger.debug("GroupDao - groupTotalCount 실행");
		return sqlSession.selectOne(NS+"groupCount");
	}
	
	public int selectGroupNo() {
		logger.debug("GroupDao - selectGroupNo 실행");
		return sqlSession.selectOne(NS+"groupNo");
	}
	public int addGroup(Group Group) {
		logger.debug("GroupDao - addGroup 실행");
		int row = sqlSession.insert(NS+"addGroup", Group);
		return row;
	}
}
	