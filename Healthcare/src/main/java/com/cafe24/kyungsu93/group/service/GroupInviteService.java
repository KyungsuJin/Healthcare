package com.cafe24.kyungsu93.group.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.kyungsu93.bloodpressure.service.BloodPressure;
import com.cafe24.kyungsu93.member.service.Member;
import com.cafe24.kyungsu93.member.service.MemberDao;

@Service
@Transactional
public class GroupInviteService {

	@Autowired
	private GroupInviteDao groupInviteDao;
	@Autowired
	private MemberDao memberDao;
	private static final Logger logger = LoggerFactory.getLogger(GroupInviteService.class);
	
	//그룹 멤버 초대
	public void addInviteMember(GroupInvite groupInvite) {
		logger.debug("BloodPressureService - addInviteMember실행");		
		String groupInviteNo = groupInvite.getGroupInviteNo();
		try {
		if(groupInviteNo == null) {
			int count = 0;
			count = groupInviteDao.totalCountInvite();
			if(count > 0) {
				int result = 0;
				String groupInviteNo_temp = "group_invite_";
				result = groupInviteDao.groupInviteNo(groupInviteNo);
				if(result > 0) {
						if(1 <= result) {
							result++;
						}			
						groupInviteNo = groupInviteNo_temp + result; 
				}
			}else {
				groupInviteNo = "group_invite_1";
			}
		}
		groupInvite.setGroupInviteNo(groupInviteNo);
		}catch(NullPointerException e) {
			e.printStackTrace();
		}
		groupInviteDao.inviteMember(groupInvite);
	}
	
	//그룹초대할 멤버 아이디 검색
	public Map<String,Object> invitefind(String memberId){
		Map<String,Object> returnMap = new HashMap<String,Object>();
		int count = 0;
		count = memberDao.memberListTotal();
		int result = 0;
		if(count>0) {
			groupInviteDao.inviteMemberId(memberId);
			returnMap.put("result", result);
		}else {
			result = 0;
			returnMap.put("result", result);
		}
		return returnMap;
	}
	
	//그룹에 초대한 멤버 리스트
	public Map<String, Object> groupInviteList(int currentPage, int pagePerRow){
		logger.debug("GroupInviteService - groupMemberList 실행");
		Map<String,Integer> map = new HashMap<String,Integer>();
		int beginRow = (currentPage-1)*pagePerRow;
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		List<GroupInvite> list = groupInviteDao.groupInviteList(map);
		int total = groupInviteDao.totalCountInvite();
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
}