package com.cafe24.kyungsu93.helper.controller.rest;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.kyungsu93.helper.service.HelperService;
import com.cafe24.kyungsu93.helper.service.SanctionKind;
import com.cafe24.kyungsu93.member.service.Member;

@RestController
public class HelperRestController {
	private static final Logger logger = LoggerFactory.getLogger(HelperRestController.class);
	@Autowired
	HelperService helperService;
	
	@RequestMapping(value="/getIdSearch", method=RequestMethod.POST)
	public Member getInsearch(@RequestParam(value="id") String memberId) {
		logger.debug("DoctorFeedbackController_getInsearch");
		Member member = helperService.selectMemberIdForSanction(memberId);
		System.out.println("시이발!!!!!!!!!!!:"+member.getMemberId());
		return member;
	} 
	@RequestMapping(value="/getSanctionKindList", method=RequestMethod.POST)
	public List<SanctionKind> getSanctionKindList() {
		logger.debug("DoctorFeedbackController_getSanctionKindList");
		List<SanctionKind> list = helperService.getSanctionKindList();
		return list;
	}
}
