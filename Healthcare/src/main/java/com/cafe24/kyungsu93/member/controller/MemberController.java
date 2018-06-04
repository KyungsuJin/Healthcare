package com.cafe24.kyungsu93.member.controller;

import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.kyungsu93.member.service.Member;
import com.cafe24.kyungsu93.member.service.MemberService;
@Controller
public class MemberController {
	@Autowired MemberService memberService;
   private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
   //아이디 찾기 페이지
   @RequestMapping(value="/memberFindId",method=RequestMethod.GET)
   public String memberFindId() {
	   logger.debug("MemberController.memberFindId GET");
	   return "member/memberFindId";
   }
   //아이디찾기
   @ResponseBody
   @RequestMapping(value="/memberFindId",method=RequestMethod.POST)
   public Map<String,Object> memberFindId(Member member) {
	   logger.debug("MemberController.memberFindId POST");
	   logger.debug(member.getMemberName());
	   logger.debug(member.getMemberEmail());
	   Member memberFind=memberService.memberFindId(member);
	   Map<String,Object> map= new HashMap<String,Object>();
	   map.put("memberFind",memberFind);
	   return map;
   }
   //패스워드 찾기 페이지
   @RequestMapping(value="/memberFindPw",method=RequestMethod.GET)
   public String memberFindPw() {
	   logger.debug("MemberController.memberFindPw GET");
	   return "member/memberFindPw";
   }
   //승인요청
   @RequestMapping(value="/approval",method=RequestMethod.GET)
   public String approval(Member member) {
	   logger.debug("MemberController.approval GET");
	   logger.debug(member.getMemberNo());
	   logger.debug("lelve"+member.getMemberLevel());
	   memberService.approval(member);
	   return "redirect:/memberApprovalList";
   }
   //승인을 기다리는 회원들의 리스트 페이지
   @RequestMapping(value="/memberApprovalContent",method=RequestMethod.GET)
   public String memberApprovalContent(Model model,Member member
		   							,HttpSession session) {
	   logger.debug("MemberController.memberApprovalContent GET");
	   logger.debug("asdfasdfasdf : "+member.getMemberNo());
	   logger.debug("asdfasdfasdf : "+member.getMemberLevel());
	   Member memberContent=memberService.memberApprovalContent(member);
	   String path = session.getServletContext().getRealPath("/resources/upload/");
	   model.addAttribute("member",memberContent);
	   model.addAttribute("path",path);
	   return "member/memberApprovalContent";
   }
   //승인을 기다리는 회원들의 리스트
   @RequestMapping(value="/memberApprovalList",method=RequestMethod.GET)
   public String memberApprovalList(Model model
		   							,@RequestParam(value="currentPage",defaultValue="1")int currentPage
		   							,@RequestParam(value="pagePerRow",defaultValue="10")int pagePerRow) {
	   logger.debug("MemberController.memberApprovalList GET");
	   Map<String,Object> map=memberService.memberApprovalList(currentPage,pagePerRow);
	   model.addAttribute("member",map.get("memberList"));
	   model.addAttribute("startPage",map.get("startPage"));
	   model.addAttribute("endPage",map.get("endPage"));
	   model.addAttribute("lastPage",map.get("lastPage"));
	   model.addAttribute("currentPage",currentPage);
	   model.addAttribute("pagePerRow",pagePerRow);
	   return "member/memberApprovalList";
   }
   //회원탈퇴 화면
   @RequestMapping(value="/memberLeave",method=RequestMethod.GET)
   public String memberLeave() {
	   logger.debug("MemberController.memberLeave GET");
	   return "member/memberLeave";
   }
   //회원 탈퇴
   @RequestMapping(value="/memberLeaveRequest",method=RequestMethod.GET)
   public String memberLeaveRequest(Member member,HttpSession session) {
	   logger.debug("MemberController.memberLeaveRequest GET");
	   logger.debug(member.getMemberId());
	   logger.debug("asd"+member.getMemberLevel());
	   String path = session.getServletContext().getRealPath("/resources/upload/");
	   memberService.memberLeaveRequest(member,path);
	   session.invalidate();
	   return "redirect:/";
   }
   //회원정보 수정화면
   @RequestMapping(value="/memberModify",method=RequestMethod.GET)
   public String memberModify(Model model,Member member) {
	   logger.debug("MemberController.memberModify GET");
	   logger.debug("memberId :"+member.getMemberId());
	   logger.debug("memberLevel :"+member.getMemberLevel());
	   Member memberImpormation=memberService.memberModifySelect(member);
	   logger.debug(memberImpormation.getMemberAddress());
	   model.addAttribute("member",memberImpormation);
	   return "member/memberModify";
   }
   //회원정보 수정
   @RequestMapping(value="/memberModify",method=RequestMethod.POST)
   public String memberModify(Member member) {
	   logger.debug("MemberController.memberModify POST");
	   logger.debug(member.toString());
	   memberService.memberModify(member);
	   return "redirect:/";
   }
   //회원정보 수정전 비밀번호 체크 화면
   @RequestMapping(value="/memberModifyCheck",method=RequestMethod.GET)
   public String memberModifyCheck() {
	   logger.debug("MemberController.memberModifyCheck GET");
	   return "member/memberModifyCheck";
   }
   //회원정보 수정전 비밀번호 체크
   @ResponseBody
   @RequestMapping(value="/memberModifyCheck",method=RequestMethod.POST)
   public int memberModifyCheck(Member member) {
	   logger.debug("MemberController.memberModifyCheck POST");
	   logger.debug("id : "+member.getMemberId());
	   logger.debug("pw : "+member.getMemberPw());
	   return memberService.memberModifyCheck(member);
   }
   //기본화면
   @RequestMapping(value="/",method=RequestMethod.GET)
   public String index() {
	   logger.debug("MemberController.index GET");
	   return "index";
   }
   //회원가입 메서드
   @RequestMapping(value="/memberInsert",method=RequestMethod.POST)
   public String memberInsert(Member member,HttpSession session) {
	   logger.debug("MemberController.memberInsert POST");
	   logger.debug(member.toString());
	   String path = session.getServletContext().getRealPath("/resources/upload/");
	   memberService.memberInsert(member,path);
	   
	   return "redirect:/";
	   }
   //회원가입 폼
   @RequestMapping(value="/memberJoin",method=RequestMethod.GET)
   public String memberjoin() {
	   logger.debug("MemberController.memberjoin GET");
	   return "member/memberJoin";
	 }
   //아이디 중복확인 폼
   @RequestMapping(value = "/memberCheck", method = RequestMethod.GET)
   public String memberCheck() {
	   logger.debug("MemberController.memberCheck GET");
	   return "member/memberIdChk";
	   }
   //아이디 중복확인 메서드
   @ResponseBody
   @RequestMapping(value = "/memberIdCheck", method = RequestMethod.POST)
   public String memberIdCheck(@RequestParam(value="id")String id) {
	   logger.debug("MemberController.memberIdCheck POST");
	   int rowcount= memberService.memberIdCheck(id);
	   logger.debug("row:"+rowcount);
      return String.valueOf(rowcount);
   }

}