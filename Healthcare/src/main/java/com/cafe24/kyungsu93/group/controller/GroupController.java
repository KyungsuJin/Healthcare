package com.cafe24.kyungsu93.group.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.kyungsu93.group.service.Group;
import com.cafe24.kyungsu93.group.service.GroupService;

@Controller
public class GroupController {
	@Autowired
	private GroupService groupService;
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
		
	@RequestMapping(value="/invitefind",method= {RequestMethod.POST,RequestMethod.GET})
	public String findId(Model model,Group group) {
		
		logger.debug("GroupController - findId 리다이렉트 실행.");
		Map<String,Object> map = groupService.inviteSearch(group);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("count", map.get("count"));
		model.addAttribute("result", map.get("result"));
		return "redirect:/group/inviteSearchList";
	}
	
	@RequestMapping(value="/inviteGroupMember", method=RequestMethod.GET)
	public String inviteGroupMember() {
		logger.debug("GroupController - inviteGroupMember 포워드 실행");
		return "group/inviteGroupMember";
	}	
	
	@RequestMapping(value="/deleteGroup", method= {RequestMethod.POST,RequestMethod.GET})
	public String deleteGroup(@RequestParam(value="groupNo") String groupNo) {
		logger.debug("GroupController - deleteGroup 리다이렉트 실행.");
		groupService.deleteGroup(groupNo);
		return "redirect:/group/groupList";
	}
	
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
	
	@RequestMapping(value="/addGroup", method=RequestMethod.POST)
	public String addGroup(Group group) {
		logger.debug("GroupController - addGroup 리다이렉트 실행");
		groupService.addGroup(group);
		return "redirect:/group/groupList";
	}
	
	@RequestMapping(value="/addGroup", method=RequestMethod.GET)
	public String addGroup() {
		logger.debug("GroupController - addGroup 포워드 실행");
		return "group/addGroup";
	}
	
}
