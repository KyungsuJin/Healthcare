package com.cafe24.kyungsu93.group.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.kyungsu93.group.service.Group;
import com.cafe24.kyungsu93.group.service.GroupService;

@Controller
public class GroupController {
	@Autowired
	private GroupService groupService;
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
	
	@ResponseBody
	@RequestMapping(value = "/checkGroupName", method = RequestMethod.GET)
    public Map<Object, Object> checkGroupName(HttpServletRequest request,Model model) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		String groupName = request.getParameter("groupName");
		int result = groupService.checkGroupName(groupName);
		map.put("cnt", result);
        return map;
    }
	
	@RequestMapping(value="/deleteGroup", method= {RequestMethod.POST,RequestMethod.GET})
	public String deleteGroup(@RequestParam(value="groupNo") String groupNo) {
		logger.debug("GroupController - deleteGroup 리다이렉트 실행.");
		groupService.deleteGroup(groupNo);
		return "redirect:/group/groupList";
	}
	
	@RequestMapping(value="/group/groupList", method=RequestMethod.GET)
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
		return "groupList";
	}
	
	@RequestMapping(value="group/addGroup", method=RequestMethod.POST)
	public String addGroup(HttpSession session,Group group,HttpServletRequest request,Model model) {
		logger.debug("GroupController - addGroup 리다이렉트 실행");
		groupService.addGroup(group);
		Map<Object, Object> map = new HashMap<Object, Object>();
		String groupName = request.getParameter("groupName");
		int result = groupService.checkGroupName(groupName);
		map.put("cnt", result);
		return "redirect:/group/groupList";
	}
	
	@RequestMapping(value="/addGroup", method=RequestMethod.GET)
	public String addGroup() {
		logger.debug("GroupController - addGroup 포워드 실행");
		return "group/addGroup";
	}
	
}