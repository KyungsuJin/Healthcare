package com.cafe24.kyungsu93.doctorfeedback.controller.rest;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.kyungsu93.diet.service.Exercise;
import com.cafe24.kyungsu93.disease.service.Disease;
import com.cafe24.kyungsu93.disease.service.MyDiseaseDetail;
import com.cafe24.kyungsu93.doctorfeedback.service.DoctorFeedbackService;
import com.cafe24.kyungsu93.doctorfeedback.service.DoctorMember;



@RestController
public class DoctorFeedbackRestController {
	private static final Logger logger = LoggerFactory.getLogger(DoctorFeedbackRestController.class);
	@Autowired
	DoctorFeedbackService doctorFeedbackService;
	
	@RequestMapping(value="/getExerciseList", method=RequestMethod.POST)
	public List<Exercise> getExerciseList() {
		logger.debug("DoctorFeedbackRestController_getExerciseList");
		List<Exercise> list = doctorFeedbackService.getExerciseList();
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i).getExerciseNo());
		}
		
		return list;
	}
	@RequestMapping(value="/selectForInsertFeedbackApproval", method=RequestMethod.POST)
	public String selectForInsertFeedbackApproval(@RequestParam("doctorFeedbackRequestNo") String doctorFeedbackRequestNo) {
		logger.debug("DoctorFeedbackRestController_selectForInsertFeedbackApproval");
		String result = doctorFeedbackService.selectForInsertFeedbackApproval(doctorFeedbackRequestNo);
		return result;
	}
	@RequestMapping(value="/getMemberDiseaseListForFeedback", method=RequestMethod.POST)
	public List<MyDiseaseDetail> getMemberDiseaseListForFeedback(@RequestParam(value="memberNo") String memberNo) {
		logger.debug("DoctorFeedbackRestController_getMemberDiseaseList");
		List<MyDiseaseDetail> list = doctorFeedbackService.getMemberDiseaseListForFeedback(memberNo);
		return list;
	}
	@RequestMapping(value="/getDiseaseList", method=RequestMethod.POST)
	public List<Disease> getDiseaseList() {
		logger.debug("DoctorFeedbackRestController_getDiseaseList");
		return doctorFeedbackService.getDiseaseList();
	}
	@RequestMapping(value="/getDoctorList", method=RequestMethod.POST)
	public List<DoctorMember> getDoctorList() {
		logger.debug("DoctorFeedbackRestController_getDoctorList");
		List<DoctorMember> list = doctorFeedbackService.getDoctorList();
		for(DoctorMember member:list) {
			System.out.println(member.getMemberName());
			System.out.println(member.getMemberHospitalName());
		}
		return list;
	}
}
