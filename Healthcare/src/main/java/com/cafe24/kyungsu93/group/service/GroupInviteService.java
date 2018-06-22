package com.cafe24.kyungsu93.group.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.kyungsu93.member.service.MemberDao;

@Service
@Transactional
public class GroupInviteService {

	@Autowired
	private GroupInviteDao groupInviteDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private GroupDao groupDao;
	private static final Logger logger = LoggerFactory.getLogger(GroupInviteService.class);
	
	public Map<String, Object> detailGroupMain(String groupName) {
		logger.debug("GroupInviteService - detailGroupMain 실행");
		GroupInvite detailGroup = groupInviteDao.detailGroupMainNameNo(groupName);
		List<GroupCalendar> addHistoryMedicine = groupInviteDao.addHistoryMedication(groupName); //복약
		List<GroupCalendar> addHistoryTreatmemt = groupInviteDao.addHistorytreatment(groupName); //진료
		List<GroupCalendar> addHistoryHealthScreen = groupInviteDao.addHistoryHealthScreen(groupName); //건강검진
		List<GroupCalendar> addHistoryHealthSurvey = groupInviteDao.addHistoryHealthSurvey(groupName); //건강설문
		Map<String,Object> returnMap = new HashMap<String,Object>();
		int historyMedicineCount = 0;
		historyMedicineCount = addHistoryMedicine.size();
		if(historyMedicineCount > 0) {
			returnMap.put("historyMedicineCount", historyMedicineCount);
		}
		int historyTreatmemtCount = 0;
		historyTreatmemtCount = addHistoryTreatmemt.size();
		if(historyTreatmemtCount> 0) {
			returnMap.put("historyTreatmemtCount", historyTreatmemtCount);
		}
		int historyHealthScreenCount = 0;
		historyHealthScreenCount = addHistoryHealthScreen.size();
		if(historyHealthScreenCount>0) {
			returnMap.put("historyHealthScreenCount", historyHealthScreenCount);
		}
		int historyHealthSurveyCount = 0;
		historyHealthSurveyCount = addHistoryHealthSurvey.size();
		if(historyHealthSurveyCount>0) {
			returnMap.put("historyHealthSurveyCount", historyHealthSurveyCount);
		}
		returnMap.put("historyMedicineCount", historyMedicineCount);
		returnMap.put("historyTreatmemtCount", historyTreatmemtCount);
		returnMap.put("historyHealthScreenCount", historyHealthScreenCount);
		returnMap.put("historyHealthSurveyCount", historyHealthSurveyCount);
		returnMap.put("detailGroup", detailGroup);
		returnMap.put("addHistoryMedicine", addHistoryMedicine);
		returnMap.put("addHistoryTreatmemt", addHistoryTreatmemt);
		returnMap.put("addHistoryHealthScreen", addHistoryHealthScreen);
		returnMap.put("addHistoryHealthSurvey", addHistoryHealthSurvey);
		return returnMap;
	}
	/**
	 * 그룹가입생성체크
	 * @param memberNo
	 * @return
	 */
	public Map<String, Object> groupJoinCreateCheck(String memberNo) {
		logger.debug("GroupInviteService - groupCalendarList 실행");
		memberNo = "member_1";
		Map<String,Object> returnMap = new HashMap<String,Object>();
		//가입햇는지
		int result = 0;
				result = groupInviteDao.memberGroupJoinCheckCount(memberNo);
		if(result>0) {
			List<GroupInvite> groupJoinList = groupInviteDao.memberGroupJoinCheck(memberNo);
			returnMap.put("groupJoinList", groupJoinList);
			returnMap.put("result", result);
		}else {
			returnMap.put("result", result);
		}
		//생성했는지
		int creationResult = 0;
		creationResult = groupDao.memberGroupCreateCheckCount(memberNo);
		if(creationResult>0) {
			List<Group> groupCreateList = groupDao.memberGroupCreateCheck(memberNo);
			returnMap.put("groupCreateList", groupCreateList);
			returnMap.put("creationResult", creationResult);
		}else {
			returnMap.put("creationResult", creationResult);
		}
		return returnMap;	
	}
	
	/**
	 * 회원 초대 취소
	 * @param groupInviteNo
	 */
	
	public void groupInviteMemberCancle(String groupInviteNo) {
		logger.debug("groupInviteDao - groupInviteMemberCancle 실행");
		groupInviteDao.groupInviteMemberCancle(groupInviteNo);
	}
	/**
	 * 그룹회원추방
	 * @param memberNo
	 */
	public void outGroupMember(String memberNo) {
		logger.debug("groupInviteDao - outGroupMember 실행");
		groupInviteDao.outGroupMember(memberNo);
	}
	/**
	 * 그룹 캘린더 리스트
	 * @param groupName
	 * @return
	 */
	public Map<String, Object> groupCalendarList(String groupName) {
		logger.debug("GroupInviteService - groupCalendarList 실행");
		List<GroupCalendar> groupCalendarMedication = groupInviteDao.groupCalendarMedication(groupName); //복약
		List<GroupCalendar> groupCalendarTreatment = groupInviteDao.groupCalendartreatment(groupName); //진료
		List<GroupCalendar> groupCalendarHealthScreen = groupInviteDao.groupCalendarHealthScreen(groupName); //건강검진
		List<GroupCalendar> groupCalendarHealthSurvey = groupInviteDao.groupCalendarHealthSurvey(groupName); //건강설문
		List<GroupInvite> groupRelationMember = groupInviteDao.groupRelationMember(groupName); //회원리스트
		GroupInvite creationMember = groupInviteDao.groupRelationGroupCreateMember(groupName); //그룹장정보
		logger.debug("groupCalendarMedication:"+groupCalendarMedication);
		logger.debug("groupCalendartreatment:"+groupCalendarTreatment);
		logger.debug("groupRelationMember:"+groupRelationMember);
		logger.debug("groupCalendarHealthSurvey:"+groupCalendarHealthSurvey);
		logger.debug("groupCalendarHealthScreen:"+groupCalendarHealthScreen);
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("groupCalendarMedication", groupCalendarMedication);
		returnMap.put("groupCalendarHealthScreen", groupCalendarHealthScreen);
		returnMap.put("groupRelationMember", groupRelationMember);
		returnMap.put("groupCalendarHealthSurvey", groupCalendarHealthSurvey);
		returnMap.put("groupCalendarTreatment", groupCalendarTreatment);
		returnMap.put("creationMember", creationMember);
		return returnMap;
	}
	
	/**
	 * 그룹관계도리스트
	 * @param groupName
	 * @return
	 */
	public Map<String, Object> groupRelationChart(String groupName) {
		logger.debug("GroupInviteService - groupRelationMember 실행");
		Map<String,Object> returnMap = new HashMap<String,Object>();
		GroupInvite createMember = groupInviteDao.groupRelationGroupCreateMember(groupName);
		String createMemb = createMember.getMemberName();
		returnMap.put("createMemb", createMemb);
		logger.debug("createMember:"+createMemb);
		List<GroupInvite> groupRelationMember = groupInviteDao.groupRelationMember(groupName);
		returnMap.put("groupRelationMember", groupRelationMember);
		logger.debug("groupRelationMember:"+groupRelationMember);
		return returnMap;
	}
	
	/**
	 * 그룹초대 수락
	 * @param inviteGroupNo
	 */
	public void acceptGroupList(GroupInvite groupInvite) {
		logger.debug("GroupInviteService - acceptGroupList 실행");
		logger.debug("groupInvite:"+groupInvite);
		String groupName = groupInvite.getGroupName();
		GroupInvite memberSearch = groupInviteDao.memberNameSearch(groupName);
		String memberName = memberSearch.getMemberName();
		String memberNo = memberSearch.getMemberNo();
		logger.debug("memberName:"+memberName);
		logger.debug("memberNo:"+memberNo);
		logger.debug("groupName:"+groupName);
		if(memberName != null) {
			GroupInvite personalSearch = groupInviteDao.personalAgreeSearch(memberNo);
			String personalInformationApproval = personalSearch.getPersonalInformationApproval();
			groupInvite.setPersonalInformationApproval(personalInformationApproval);
			groupInvite.setMemberNo(memberNo);
			groupInvite.setGroupName(groupName);
			logger.debug("personalInformationApproval:"+personalInformationApproval);
			logger.debug("groupInvite:"+groupInvite);
			groupInviteDao.acceptGroupList(groupInvite);
		}
	}
		
	/**
	 * 그룹 회원 리스트
	 * @param currentPage
	 * @param pagePerRow
	 * @param groupName
	 * @return
	 */
	public Map<String, Object> groupMemberList(int currentPage, int pagePerRow, String groupName) {
		logger.debug("GroupInviteService - groupMemberList 실행");
		logger.debug("groupName:"+groupName);
		//회원 수 조회
		int total = 0;
		total = groupInviteDao.groupMemberListCount(groupName);
		//회원이 있을경우 리스트 출력
		Group groupNoSearch = groupDao.groupNoSearch(groupName);
		String groupNoSend = groupNoSearch.getGroupNo();
		logger.debug("groupNoSend:"+groupNoSend);
		Map<String,Object> map = new HashMap<String,Object>();
		int beginRow = (currentPage-1)*pagePerRow;
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		map.put("groupName", groupName);
		List<GroupInvite> list = groupInviteDao.groupMemberList(map);
		Map<String,Object> returnMap = new HashMap<String,Object>();
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
		returnMap.put("groupNoSend", groupNoSend);
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		returnMap.put("firstBlockPage", firstBlockPage);
		returnMap.put("lastBlockPage", lastBlockPage);
		returnMap.put("totalBlock", totalBlock);
		returnMap.put("memberCountResult", total);
		return returnMap;
	}
	
	/**
	 * 나를 초대한 그룹 리스트
	 * @param currentPage
	 * @param pagePerRow
	 * @return
	 */
	public Map<String, Object> inviteGroupList(int currentPage, int pagePerRow){
		logger.debug("GroupInviteService - inviteGroupList 실행");
		Map<String,Integer> map = new HashMap<String,Integer>();
		int beginRow = (currentPage-1)*pagePerRow;
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		List<GroupInvite> list = groupInviteDao.inviteGroupList(map);
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
	
	/**
	 * 그룹에 초대한 회원리스트
	 * @param currentPage
	 * @param pagePerRow
	 * @return
	 */
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
	
	/**
	 * 회원 초대
	 * @param groupInvite
	 */
	public void addInviteMember(GroupInvite groupInvite) {
		logger.debug("GroupInviteService - addInviteMember실행");		
		String groupInviteNo = groupInvite.getGroupInviteNo();
		String memberId = groupInvite.getMemberId();
		String groupInviteMessage = groupInvite.getGroupInviteMessage();
		String groupNo = groupInvite.getGroupNo();
		logger.debug("memberId:"+memberId);
		logger.debug("groupInviteNo:"+groupInviteNo);
		logger.debug("groupNo:"+groupNo);
		logger.debug("groupInviteMessage:"+groupInviteMessage);
		groupInvite = groupInviteDao.groupInviteMemberName(memberId);
		String memberNo = groupInvite.getMemberNo();
		logger.debug("memberNo:"+memberNo);
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
		String groupInviteApproval = "F";
		groupInvite.setGroupInviteApproval(groupInviteApproval);
		groupInvite.setGroupInviteNo(groupInviteNo);
		groupInvite.setMemberNo(memberNo);
		groupInvite.setGroupInviteMessage(groupInviteMessage);
		groupInvite.setGroupNo(groupNo);
		}catch(NullPointerException e) {
			e.printStackTrace();
		}
		groupInviteDao.inviteMember(groupInvite);
	}
	
	/**
	 * 회원 아이디 검색
	 * @param memberId
	 * @return
	 */
	public Map<String,Object> invitefind(String memberId){
		logger.debug("GroupInviteService - invitefind실행");		
		Map<String,Object> returnMap = new HashMap<String,Object>();
		int count = 0;
		count = memberDao.memberListTotal();
		String name = null;
		int result = 0;
		if(count>0) {
			result = groupInviteDao.inviteMemberId(memberId);
			returnMap.put("result", result);
			if(result>0) {
				GroupInvite groupInvite = groupInviteDao.groupInviteMemberName(memberId);
				name = groupInvite.getMemberName();
				returnMap.put("name", name);
			}
		}else {
			result = 0;
			name = "공백";
			returnMap.put("result", result);
			returnMap.put("name", name);
		}
		return returnMap;
	}
	
	/**
	 * 하나의 그룹 검색
	 * @param groupNo
	 * @return
	 */
	public Group inviteGroup(String groupNo) {
		logger.debug("GroupInviteService - inviteGroup실행");	
		Group groupTable = groupDao.modifyGroup(groupNo);
		return groupTable;
	}
	
}
