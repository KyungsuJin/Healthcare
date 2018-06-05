package com.cafe24.kyungsu93.group.service;

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
	
	public Map<String, Object> inviteSearch(Group group){
		logger.debug("GroupService - inviteSearch 실행");
		String memberName = group.getMemberName();
		String memberId = group.getMemberId();
		logger.debug("memberName:"+memberName);
		logger.debug("memberId:"+memberId);
		Map<String,Object> returnMap = new HashMap<String,Object>();
		if(memberName != null) {
			int count = 0;
			count = groupDao.findName(memberName);
			returnMap.put("memberName", memberName);
			if(count > 0) {
				int result = 4;
				List<Group> list = groupDao.findNameOne(memberName);
				returnMap.put("list", list);
				returnMap.put("result", result);
				returnMap.put("count", count);
				logger.debug("list:"+list);
				logger.debug("count:"+count);
			}else {
				int result = 2;
				returnMap.put("result", result);
			}
		}else if(memberId != null) {
			int count = 0;
			count = groupDao.findId(memberId);
			returnMap.put("memberId", memberId);
			if(count > 0) {
				int result = 3;
				returnMap.put("list", groupDao.findIdOne(memberId));
				returnMap.put("count", count);
				returnMap.put("result", result);
				logger.debug("list:"+ groupDao.findIdOne(memberId));
				logger.debug("memberId:"+memberId);
				logger.debug("count:"+count);
			}else {
				int result = 1;
				returnMap.put("result", result);
			}
		}
		return returnMap;
	}
	
	public int deleteGroup(String groupNo) {
		logger.debug("GroupService - deleteGroup 실행");
		return groupDao.deleteGroup(groupNo);
	}
	
	public  Map<String, Object> groupList(int currentPage, int pagePerRow) {
		logger.debug("GroupService - groupList 실행");
		Map<String,Integer> map = new HashMap<String,Integer>();
		int beginRow = (currentPage-1)*pagePerRow;
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		List<Group> list = groupDao.groupList(map);
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
        logger.debug("======================page block=========================");
       
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
		logger.debug("======================page block=========================");
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		returnMap.put("firstBlockPage", firstBlockPage);
		returnMap.put("lastBlockPage", lastBlockPage);
		returnMap.put("totalBlock", totalBlock);
		return returnMap;
	}
	
	public int checkGroupName(String groupName) {
		logger.debug("GroupService - addGroup실행");		
		return groupDao.checkGroupName(groupName);
	}
	
	public void addGroup(Group group) {
		logger.debug("GroupService - addGroup실행");		
		String groupNo = group.getGroupNo();
		try {
			if(groupNo == null) {
				int count = 0;
				count = groupDao.groupTotalCount();
				if(count > 0) {
					int result = 0;
					String groupNo_temp = "group_";
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

