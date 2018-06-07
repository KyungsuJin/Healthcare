package com.cafe24.kyungsu93.member.controller.rest;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.kyungsu93.member.controller.MemberController;
import com.cafe24.kyungsu93.member.service.Member;
import com.cafe24.kyungsu93.member.service.MemberService;

@RestController
public class MemberRestController {
	@Autowired MemberService memberService;
	private static final Logger logger = LoggerFactory.getLogger(MemberRestController.class);
	
	//회원 리스트,페이징,검색
	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public Map<String, Object> memberList(Model model,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "pagePerRow", defaultValue = "10") int pagePerRow,
			@RequestParam(value = "memberLevel") int memberLevel,
			@RequestParam(value = "searchSelect", required = false, defaultValue = "") String searchSelect,
			@RequestParam(value = "searchText", required = false, defaultValue = "") String searchText) {
		logger.debug("MemberController.memberList GET");
		logger.debug("searchSelect : " + searchSelect);
		logger.debug("searchText : " + searchText);
		logger.debug("memberLevel : " + memberLevel);
		Map<String, Object> map = memberService.memberList(currentPage, pagePerRow, memberLevel, searchText,
				searchSelect);
		model.addAttribute("memberList", map.get("memberList"));
		model.addAttribute("startPage", map.get("startPage"));
		model.addAttribute("endPage", map.get("endPage"));
		model.addAttribute("lastPage", map.get("lastPage"));
		map.put("currentPage", currentPage);
		map.put("pagePerRow", pagePerRow);
		model.addAttribute("currentPage", map.get("currentPage"));
		model.addAttribute("pagePerRow", map.get("pagePerRow"));
		return map;
	}
	// 아이디찾기
	@RequestMapping(value = "/memberFindId", method = RequestMethod.POST)
	public Map<String, Object> memberFindId(Member member) {
		logger.debug("MemberController.memberFindId POST");
		logger.debug(member.getMemberName());
		logger.debug(member.getMemberEmail());
		String memberId = memberService.memberFindId(member);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		return map;
	}

	// 패스워드 찾기 페이지
	@RequestMapping(value = "/memberFindPw", method = RequestMethod.POST)
	public Map<String, Object> memberFindPw(Member member) {
		logger.debug("MemberController.memberFindPw GET");
		logger.debug(member.getMemberId());
		logger.debug(member.getMemberEmail());
		String memberPw = memberService.memberFindPw(member);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberPw", memberPw);
		return map;
	}

	// 회원정보 수정전 비밀번호 체크
	@RequestMapping(value = "/memberModifyCheck", method = RequestMethod.POST)
	public int memberModifyCheck(Member member) {
		logger.debug("MemberController.memberModifyCheck POST");
		logger.debug("id : " + member.getMemberId());
		logger.debug("pw : " + member.getMemberPw());
		return memberService.memberModifyCheck(member);
	}

	// 아이디 중복확인 메서드
	@RequestMapping(value = "/memberIdCheck", method = RequestMethod.POST)
	public String memberIdCheck(@RequestParam(value = "id") String id) {
		logger.debug("MemberController.memberIdCheck POST");
		int rowcount = memberService.memberIdCheck(id);
		logger.debug("row:" + rowcount);
		return String.valueOf(rowcount);
	}
}
