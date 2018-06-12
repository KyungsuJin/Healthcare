package com.cafe24.kyungsu93.group.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class GroupService {
	@Autowired
	private GroupDao groupDao;
	private static final Logger logger = LoggerFactory.getLogger(GroupService.class);
	
	//그룹수정
	public void modifyGroupResult(String groupNo, String groupInfo,String groupKindNo) {
		logger.debug("GroupService - modifyGroupResult실행");
		Group group = new Group();
		group.setGroupInfo(groupInfo);
		group.setGroupKindNo(groupKindNo);
		group.setGroupNo(groupNo);
		groupDao.modifyGroupResult(group);
	}
	
	//그룹수정
	public Group modifyGroup(String groupNo) {
		logger.debug("GroupService - modifyGroup 실행");
		Group group = groupDao.modifyGroup(groupNo);
		return group;
	}
	
	//그룹삭제리스트
	public Map<String, Object> deleteGroupList() {
		logger.debug("GroupService - deleteList 실행");
		Map<String,Integer> map = new HashMap<String,Integer>();
		//총 삭제 유예 기간에 있는 그룹 검색
		int total = groupDao.groupdeleteCount();
		int i = 0;
		//그룹 유예기간 삭제 리스트에 등록된 게시물 수만큼 반복
		for( i = 0; i<total; i++ ) {
			//현재 날짜와 비교해서 그룹삭제유예기간이 만료된 그룹 삭제 
		    Date today = new Date();
		    SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
		    String now = date.format(today);
		    logger.debug("현재시간:"+now);
		    //삭제유예기간에 들어가있는 그룹중 중 제일 오래된 날짜 검색
			Group day = groupDao.groupDdaycheck();
			String groupExpiredDate = day.getGroupExpiredDate();
			logger.debug("유예 기간 groupExpiredDate:"+groupExpiredDate);
			int compare = now.compareTo(groupExpiredDate);
			//현재 날짜와 비교해서 유예기간 만료된 그룹 삭제
			if(compare > 0) {
				logger.debug("유예기간 날짜이 지났습니다. 그룹 삭제 진행.");
				Group number = groupDao.groupDdayNo(groupExpiredDate);
				String groupNo = number.getGroupNo();
				logger.debug("groupNo:"+groupNo);
				if(groupNo != null) {
					int count = 0;
					count = groupDao.deleteGroup(groupNo);
						if(count > 0) {
							groupDao.deleteGroupDelete(groupNo);
							logger.debug("그룹삭제완료.");
						}
					}
			}
		}
		//삭제유예기간에 있는 리스트 출력
		List<Group> list = groupDao.deleteGroupList(map);
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("list", list);
		return returnMap;
	}
	
	//그룹 삭제 또는 그룹삭제유예기간 등록
	public void deleteGroup(String groupNo) {
		logger.debug("GroupService - deleteGroup 실행");
		//그룹번호로 그룹명 검색
		Group group = groupDao.groupDeleteCheckgroupNo(groupNo);
		String groupName = group.getGroupName();
		//그룹명으로 회원검색
		int count = 0;
		count = groupDao.groupDeleteCheckMemberCount(groupName);
		if(count>0) {
			//회원이 있을경우 유예기간 등록
			groupDao.deleteApproval(groupNo);
		}else {
			//회원이 없을 경우 바로 삭제
			groupDao.deleteGroup(groupNo);
		}
	}	
	
	//생성된그룹리스트
	public Map<String, Object> groupList(int currentPage, int pagePerRow) {
		logger.debug("GroupService - groupList 실행");
		Map<String,Integer> map = new HashMap<String,Integer>();
		int beginRow = (currentPage-1)*pagePerRow;
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		//리스트 배열
		List<Group> list = groupDao.groupList(map);
		//리스트에 등록된 총 게시물 수 
		int total = groupDao.groupTotalCount();
		int lastPage = total/pagePerRow;
        if(total % pagePerRow != 0) {
            lastPage++;
        }
        logger.debug("list:"+list);
        logger.debug("lastPage:"+lastPage);
        logger.debug("currentPage:"+currentPage);
        logger.debug("beginRow:"+beginRow);
        logger.debug("pagePerRow:"+pagePerRow);
        logger.debug("====================== page block =========================");
       
        int pagePerBlock = 10; //보여줄 블록 수 
        int block = currentPage/pagePerBlock;
        int totalBlock = total/pagePerBlock;//총 블록수
        
        if(currentPage % pagePerBlock != 0) {
        	block ++;
        }
        int firstBlockPage = (block-1)*pagePerBlock+1;
        int lastBlockPage = block*pagePerBlock;
        
		if(lastPage > 0) {			
			if(lastPage % pagePerBlock != 0) {
				totalBlock++;
			}
		}
		if(lastBlockPage >= totalBlock) {
			lastBlockPage = totalBlock;
		}
		logger.debug("firstBlockPage:"+firstBlockPage);
		logger.debug("lastBlockPage:"+lastBlockPage);
		logger.debug("block:"+block);
		logger.debug("totalBlock:"+totalBlock);
		logger.debug("====================== page block =========================");
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		returnMap.put("firstBlockPage", firstBlockPage);
		returnMap.put("lastBlockPage", lastBlockPage);
		returnMap.put("totalBlock", totalBlock);
		return returnMap;
	}
	
	//그룹명 검색
	public  Map<String, Object> checkGroupName(String groupName) {
		logger.debug("GroupService - checkGroupName실행");	
		Map<String,Object> returnMap = new HashMap<String,Object>();
		int count = 0;
		//그룹 전체 검색
		count = groupDao.groupTotalCount();
		int result = 0;
		if(count >0) {
			//그룹명 검색
			result = groupDao.checkGroupNameCount(groupName);
			returnMap.put("result", result);
		}else {
			result = 0;
			returnMap.put("result", result);
		}
		return returnMap;
	}
	
	//그룹생성
	public void addGroup(Group group) {
		logger.debug("GroupService - addGroup실행");		
		String groupNo = group.getGroupNo();
		try {
			if(groupNo == null) {
				//그룹전체검색
				int count = 0;
				count = groupDao.groupTotalCount();
				if(count > 0) {
					int result = 0;
					String groupNo_temp = "group_";
					//그룹 번호 최대값 검색
					result = groupDao.selectGroupNo(groupNo);
					if(result > 0) {
						if(1 <= result) {
							result++;
						}
						groupNo = groupNo_temp + result; 
					}
				}else {
					groupNo = "group_1";
				}
			}
			group.setGroupNo(groupNo);
			
		}catch(NullPointerException e) {
			e.printStackTrace();
		}
		groupDao.addGroup(group);
		}
	}

