package com.cafe24.kyungsu93.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

import com.cafe24.kyungsu93.member.service.Member;
import com.cafe24.kyungsu93.member.service.MemberService;
@Controller
public class MemberController {
	@Autowired MemberService memberService;
   private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
   
 //회원 강퇴
   @RequestMapping(value="/memberExpulsion",method=RequestMethod.GET)
   public String memberExpulsion(Member member,HttpSession session) {
	   logger.debug("MemberController.memberExpulsion GET");
	   logger.debug(member.getMemberNo());
	   logger.debug("asd"+member.getMemberLevel());
	   String path = session.getServletContext().getRealPath("/resources/upload/");
	   memberService.memberLeaveRequest(member,path);
	   String result="";
	   if(member.getMemberLevel()==2) {
		   result="member/memberList";
	   }else if(member.getMemberLevel()==3) {
		   result="member/memberDoctorList";
	   }else if(member.getMemberLevel()==4) {
		   result="member/memberPtList";
	   }
	   return result;
   }
   //기본회원 리스트 폼 출력
   @RequestMapping(value="/basicMemberLis",method=RequestMethod.GET)
   public String basicMemberLis(Model model,@RequestParam(value="currentPage",defaultValue="1")int currentPage
		   				,@RequestParam(value="searchSelect",required=false)String searchSelect
	   					,@RequestParam(value="searchTextTest",required=false)String searchText) {
	   logger.debug("MemberController.basicMemberLis");
	   logger.debug("searchSelect : " +searchSelect);
	   logger.debug("searchText : " +searchText);
	   model.addAttribute("currentPage",currentPage);
	   model.addAttribute("searchSelect",searchSelect);
	   model.addAttribute("searchText",searchText);
	   return "member/memberList";
   }
   //의사회원 리스트 폼 출력
   @RequestMapping(value="/doctorMemberList",method=RequestMethod.GET)
   public String doctorMemberList(Model model,@RequestParam(value="currentPage",defaultValue="1")int currentPage
		   				,@RequestParam(value="searchSelect",required=false)String searchSelect
		   				,@RequestParam(value="searchTextTest",required=false)String searchText) {
	   logger.debug("MemberController.doctorMemberList");
	   logger.debug("searchSelect : " +searchSelect);
	   logger.debug("searchText : " +searchText);
	   model.addAttribute("currentPage",currentPage);
	   model.addAttribute("searchSelect",searchSelect);
	   model.addAttribute("searchText",searchText);
	   return "member/memberDoctorList";
   }
   //pt 회원 리스트  폼 출력
   @RequestMapping(value="/PtMemberList",method=RequestMethod.GET)
   public String PtMemberList(Model model,@RequestParam(value="currentPage",defaultValue="1")int currentPage
		   				,@RequestParam(value="searchSelect",required=false)String searchSelect
						,@RequestParam(value="searchTextTest",required=false)String searchText) {
	   logger.debug("MemberController.PtMemberList");
	   logger.debug("searchSelect : " +searchSelect);
	   logger.debug("searchText : " +searchText);
	   model.addAttribute("currentPage",currentPage);
	   model.addAttribute("searchSelect",searchSelect);
	   model.addAttribute("searchText",searchText);
	   return "member/memberPtList";
   }
   
   //회원검색 선택
   @RequestMapping(value="/memberListChoice",method=RequestMethod.GET)
   public String memberListChoice() {
	   logger.debug("MemberController.memberListChoice GET");
	   return "member/memberListChoice";
   }
   //패스워드 찾기 결과 페이지
   @RequestMapping(value="/memberFindPwResult",method=RequestMethod.GET)
   public String memberFindPwResult() {
	   logger.debug("MemberController.memberFindPwResult GET");
	   return "member/memberFindPwResult";
   }
   //아이디 찾기 결과 페이지
   @RequestMapping(value="/memberFindIdResult",method=RequestMethod.GET)
   public String memberFindIdResult() {
	   logger.debug("MemberController.memberFindIdResult GET");
	   return "member/memberFindIdResult";
   }
   //아이디 찾기 페이지
   @RequestMapping(value="/memberFindId",method=RequestMethod.GET)
   public String memberFindId() {
	   logger.debug("MemberController.memberFindId GET");
	   return "member/memberFindId";
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
	   logger.debug("MemberNo : "+member.getMemberNo());
	   logger.debug("MemberLevel : "+member.getMemberLevel());
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
  

}