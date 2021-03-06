package com.cafe24.kyungsu93.doctorfeedback.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.kyungsu93.doctorfeedback.service.DoctorFeedbackRequest;
import com.cafe24.kyungsu93.doctorfeedback.service.DoctorFeedbackResult;
import com.cafe24.kyungsu93.doctorfeedback.service.DoctorFeedbackService;
import com.cafe24.kyungsu93.doctorfeedback.service.DoctorGoodExercise;


@Controller
public class DoctorFeedbackController {
	private static final Logger logger = LoggerFactory.getLogger(DoctorFeedbackController.class);
	@Autowired
	DoctorFeedbackService doctorFeedbackService;

	@RequestMapping(value="/getDoctorFeedbackResultDetail", method=RequestMethod.GET)
	public String getDoctorFeedbackResultDetail() {
		logger.debug("DoctorFeedbackController_getDoctorFeedbackResultDetail");
		return "";
	}
	@RequestMapping(value="/getDoctorFeedbackResult", method=RequestMethod.GET)
	public String getDoctorFeedbackResult(Model model
											,@RequestParam(value="doctorFeedbackRequestNo") String doctorFeedbackResultNo) {
		logger.debug("DoctorFeedbackController_getDoctorFeedbackResult");
		List<DoctorFeedbackResult> list = doctorFeedbackService.getDoctorFeedbackResult(doctorFeedbackResultNo);
		System.out.println(list.size());
		model.addAttribute("list", list);
		return "doctorfeedback/getDoctorFeedbackResult";
	}	
	@RequestMapping(value="/addDoctorFeedbackResult", method=RequestMethod.GET)
	public String addDoctorFeedbackResult(Model model
											,@RequestParam(value="doctorFeedbackRequestNo") String doctorFeedbackRequestNo
											,@RequestParam(value="memberNo") String memberNo
											,@RequestParam(value="diseaseNo") String diseaseNo) {
		logger.debug("DoctorFeedbackController_addDoctorFeedbackResult_GET");
		model.addAttribute("doctorFeedbackRequestNo", doctorFeedbackRequestNo);
		model.addAttribute("memberNo", memberNo);
		model.addAttribute("diseaseNo", diseaseNo);
		return "doctorfeedback/addDoctorFeedbackResult";

	}
	@RequestMapping(value="/addDoctorFeedbackResult", method=RequestMethod.POST)
	public String addDoctorFeedbackResult(DoctorFeedbackResult doctorFeedbackResult, DoctorGoodExercise doctorGoodExercise) {
		logger.debug("DoctorFeedbackController_addDoctorFeedbackResult_POST");
		doctorFeedbackService.addDoctorFeedbackResult(doctorFeedbackResult,doctorGoodExercise);
		return "redirect:/getDoctorFeedbackResult?doctorFeedbackRequestNo="+doctorFeedbackResult.getDoctorFeedbackRequestNo();
	}
	@RequestMapping(value="/addDoctorFeedbackApprovalAcceptance", method=RequestMethod.GET)
	public String addDoctorFeedbackApprovalAcceptance(@RequestParam(value="doctorFeedbackRequestNo") String doctorFeedbackRequestNo
											,@RequestParam(value="doctorFeedbackApproval") String doctorFeedbackApproval) {
		logger.debug("DoctorFeedbackController_addDoctorFeedbackApprovalAcceptance");
		doctorFeedbackService.addDoctorFeedbackApproval(doctorFeedbackRequestNo, doctorFeedbackApproval);
		return "doctorfeedback/addDoctorFeedbackResult";
	}
	@RequestMapping(value="/getDoctorFeedbackRequestedDetail", method=RequestMethod.GET)
	public String getDoctorFeedbackRequestedDetail(Model model
													,@RequestParam(value="doctorFeedbackRequestNo") String doctorFeedbackRequestNo) {
		logger.debug("DoctorFeedbackController_getDoctorFeedbackRequestedDetail");
		DoctorFeedbackRequest doctorFeedbackRequest = doctorFeedbackService.getDoctorFeedbackRequestedDetail(doctorFeedbackRequestNo);
		model.addAttribute("doctorFeedbackRequest", doctorFeedbackRequest);
		return "doctorfeedback/getDoctorFeedbackRequestedDetail";
	}
	@RequestMapping(value="/getDoctorFeedbackRequestedList", method=RequestMethod.GET)
	public String getDoctorFeedbackRequestedList(Model model) {
		logger.debug("DoctorFeedbackController_getDoctorFeedbackRequestedList");
		List<DoctorFeedbackRequest> list = doctorFeedbackService.getDoctorFeedbackRequestedList();
		model.addAttribute("list", list);
		return "doctorfeedback/getDoctorFeedbackRequestedList";
	}
	@RequestMapping(value="/removeDoctorFeedbackRequest", method=RequestMethod.GET)
	public String removeDoctorFeedbackRequest(@RequestParam(value="doctorFeedbackRequestNo") String doctorFeedbackRequestNo) {
		logger.debug("DoctorFeedbackController_removeDoctorFeedbackRequest");
		doctorFeedbackService.removeDoctorFeedbackRequest(doctorFeedbackRequestNo);
		return "doctorfeedback/getDoctorFeedbackRequestList";
	}
	@RequestMapping(value="/getDoctorFeedbackRequestDetail", method=RequestMethod.GET)
	public String getDoctorFeedbackRequestDetail(Model model
													,@RequestParam("doctorFeedbackRequestNo") String doctorFeedbackRequestNo) {
		logger.debug("DoctorFeedbackController_getDoctorFeedbackRequestDetail");
		////////////////////////////////////////////////////////////////////////////////////
		System.out.println("doctorFeedbackRequestNo : " +doctorFeedbackRequestNo);
		DoctorFeedbackRequest doctorFeedbackRequest = doctorFeedbackService.getDoctorFeedbackRequestDetail(doctorFeedbackRequestNo);
		model.addAttribute("doctorFeedbackRequest", doctorFeedbackRequest);
		return "doctorfeedback/getDoctorFeedbackRequestDetail";
	}
	@RequestMapping(value="/getDoctorFeedbackRequestList")
	public String getDoctorFeedbackRequestList(Model model) {
		logger.debug("DoctorFeedbackController_getDoctorFeedbackRequestList");
		List<DoctorFeedbackRequest> list = doctorFeedbackService.getDoctorFeedbackRequestList();
		model.addAttribute("list", list);
		return "doctorfeedback/getDoctorFeedbackRequestList";
	}
	@RequestMapping(value="/doctorFeedbackRequest", method=RequestMethod.POST)
	public String doctorFeedbackRequest(DoctorFeedbackRequest doctorFeedbackRequest) {
		logger.debug("DoctorFeedbackController_doctorFeedbackRequest_POST");
		doctorFeedbackService.doctorFeedbackRequest(doctorFeedbackRequest);
		return "redirect:/getDoctorFeedbackRequestList";
	}
	@RequestMapping(value="/doctorFeedbackRequest", method=RequestMethod.GET)
	public String doctorFeedbackRequest() {
		logger.debug("DoctorFeedbackController_doctorFeedbackRequest_GET");
		return "doctorfeedback/doctorFeedbackRequest";
	}
}
