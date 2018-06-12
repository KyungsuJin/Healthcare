package com.cafe24.kyungsu93.group.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.kyungsu93.group.service.Group;
import com.cafe24.kyungsu93.group.service.GroupInvite;
import com.cafe24.kyungsu93.group.service.GroupInviteService;
import com.cafe24.kyungsu93.group.service.GroupService;

@Controller
public class GroupController {
	@Autowired
	private GroupService groupService;
	@Autowired
	private GroupInviteService groupInviteService;
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
	
	//그룹에 초대된 멤버 리스트
	@RequestMapping(value="/inviteMemberList", method=RequestMethod.GET)
	public String inviteMemberList() {
		logger.debug("GroupController - inviteMemberList 포워드 실행");
		
		return "group/inviteMemberList";
	}
	
	@RequestMapping(value="/inviteMember", method=RequestMethod.POST)
	public String inviteMember(GroupInvite groupInvite,HttpServletRequest request) {
		logger.debug("GroupController - inviteMemberForm 리다이렉트 실행");
		groupInviteService.addInviteMember(groupInvite);
		return "redirect:/groupList";
	}

	//그룹 멤버초대
	@RequestMapping(value="/inviteMemberForm", method=RequestMethod.GET)
	public String inviteMemberForm(Model model,@RequestParam(value="groupNo") String groupNo) {
		logger.debug("GroupController - inviteMemberForm 포워드 실행");
		Group groupTable = groupInviteService.inviteGroup(groupNo);
		model.addAttribute("groupTable", groupTable);
		return "group/inviteMemberForm";
	}
	
	//그룹 수정 완료
	@RequestMapping(value="/modifyGroup",method=RequestMethod.POST)
	public String modifyGroup(@RequestParam(value="groupNo") String groupNo
							,@RequestParam(value="groupKindNo") String groupKindNo
							,@RequestParam(value="groupInfo") String groupInfo) {
		logger.debug("GroupController - modifyGroup 리다이렉트 실행.");
		groupService.modifyGroupResult(groupNo, groupInfo, groupKindNo);
		return "redirect:/groupList";
	}
		
	//그룹 수정
	@RequestMapping(value="/modifyGroup", method=RequestMethod.GET)
	public String modifyGroup(Model model,@RequestParam(value="groupNo") String groupNo) {
		logger.debug("GroupController - modifyGroup 포워드 실행.");
		Group groupTable = groupService.modifyGroup(groupNo);
		model.addAttribute("groupTable", groupTable);
		return "group/modifyGroup";
	}	
	
	//삭제 유예 등록된 그룹 리스트
	@RequestMapping(value="/deleteGroupList", method=RequestMethod.GET)
	public String deleteGroupList(Model model) {
		logger.debug("GroupController - deleteGroupList 포워드 실행");
		Map<String,Object> map = groupService.deleteGroupList();
		model.addAttribute("list", map.get("list"));
		return "group/deleteGroupList";
	}
	
	//그룹 삭제유예기간 등록
	@RequestMapping(value="/deleteGroup", method=RequestMethod.POST)
	public String deleteApproval(@RequestParam(value="groupNo") String groupNo) {
		logger.debug("GroupController - deleteApproval 리다이렉트 실행.");
		groupService.deleteGroup(groupNo);
		return "redirect:/groupList";
	}
	
	//생성된 그룹 리스트
	@RequestMapping(value="/groupList", method=RequestMethod.GET)
	public String groupList(Model model
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage
								,@RequestParam(value="pagePerRow", defaultValue="10")int pagePerRow) {
		logger.debug("GroupController - groupList 포워드 실행");
		Map<String,Object> map = groupService.groupList(currentPage, pagePerRow);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastBlockPage", map.get("lastBlockPage"));
		model.addAttribute("firstBlockPage", map.get("firstBlockPage"));
		model.addAttribute("totalBlock", map.get("totalBlock"));
		return "group/groupList";
	}
	
	//그룹 생성
	@RequestMapping(value="/addGroup", method=RequestMethod.POST)
	public String addGroup(Group group,HttpServletRequest request) {
		logger.debug("GroupController - addGroup 리다이렉트 실행");
		groupService.addGroup(group);
		return "redirect:/groupList";
	}
	
	@RequestMapping(value="/addGroup", method=RequestMethod.GET)
	public String addGroup() {
		logger.debug("GroupController - addGroup 포워드 실행");
		return "group/addGroup";
	}
	
}
