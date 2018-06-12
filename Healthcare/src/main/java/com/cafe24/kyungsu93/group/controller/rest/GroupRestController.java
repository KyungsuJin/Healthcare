package com.cafe24.kyungsu93.group.controller.rest;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.kyungsu93.group.service.GroupInviteService;
import com.cafe24.kyungsu93.group.service.GroupService;

@RestController
public class GroupRestController {
	@Autowired
	private GroupService groupService;
	@Autowired
	private GroupInviteService groupInviteService;
	private static final Logger logger = LoggerFactory.getLogger(GroupRestController.class);
	
	@RequestMapping(value="/invitefind", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> searchMember(@RequestParam(value="memberId") String memberId) {
		logger.debug("GroupController - SearchMemberForm ajax 실행");
		logger.debug("memberId:"+memberId);
		Map<String,Object> map = groupInviteService.invitefind(memberId);
		map.get("result");
		logger.debug("result:"+map.get("result"));
		return map;
	}
	
	@RequestMapping(value="/checkGroupName", method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
    public Map<String, Object> checkGroupName(@RequestParam(value="groupName") String groupName) {
		logger.debug("GroupController - checkGroupName ajax 실행");
		logger.debug("groupName:"+groupName);
		Map<String,Object> map = groupService.checkGroupName(groupName);
		map.get("result");
		logger.debug("result:"+map.get("result"));
		return map;
    }
}
