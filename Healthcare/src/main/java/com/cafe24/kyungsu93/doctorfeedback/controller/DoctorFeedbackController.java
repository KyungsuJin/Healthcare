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


@Controller
public class DoctorFeedbackController {
	private static final Logger logger = LoggerFactory.getLogger(DoctorFeedbackController.class);
	@Autowired
	DoctorFeedbackService doctorFeedbackService;
	@RequestMapping(value="/addDoctorFeedbackResult", method=RequestMethod.GET)
	public String addDoctorFeedbackResult(Model model
											,@RequestParam(value="doctorFeedbackRequestNo") String doctorFeedbackRequestNo
											,@RequestParam(value="memberNo") String memberNo) {
		logger.debug("DoctorFeedbackController_addDoctorFeedbackResult_GET");
		model.addAttribute("doctorFeedbackRequestNo", doctorFeedbackRequestNo);
		model.addAttribute("memberNo", memberNo);
		return "doctorfeedback/addDoctorFeedbackResult";

	}
	@RequestMapping(value="/addDoctorFeedbackResult", method=RequestMethod.POST)
	public String addDoctorFeedbackResult(DoctorFeedbackResult doctorFeedbackResult) {
		logger.debug("DoctorFeedbackController_addDoctorFeedbackResult_POST");
		doctorFeedbackService.addDoctorFeedbackResult(doctorFeedbackResult);
		return "";
	}
	@RequestMapping(value="/addDoctorFeedbackApprovalAcceptance", method=RequestMethod.GET)
	public String addDoctorFeedbackApprovalAcceptance(@RequestParam(value="doctorFeedbackRequestNo") String doctorFeedbackRequestNo
											,@RequestParam(value="doctorFeedbackApproval") String doctorFeedbackApproval) {
		logger.debug("DoctorFeedbackController_addDoctorFeedbackApprovalAcceptance");
		doctorFeedbackService.addDoctorFeedbackApproval(doctorFeedbackRequestNo, doctorFeedbackApproval);
		return "doctorfeedback/getDoctorFeedbackRequestedDetail?doctorFeedbackRequestNo=1";
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
	public String getDoctorFeedbackRequestDetail() {
		logger.debug("DoctorFeedbackController_getDoctorFeedbackRequestDetail");
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
