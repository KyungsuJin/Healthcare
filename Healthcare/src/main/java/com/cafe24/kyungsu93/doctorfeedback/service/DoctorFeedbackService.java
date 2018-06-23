package com.cafe24.kyungsu93.doctorfeedback.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.kyungsu93.disease.service.Disease;
import com.cafe24.kyungsu93.disease.service.MyDiseaseDetail;


@Service
public class DoctorFeedbackService {
	private static final Logger logger = LoggerFactory.getLogger(DoctorFeedbackService.class);
	@Autowired
	DoctorFeedbackDao doctorFeedbackDao;
	@Autowired
	HttpSession session;

	public DoctorFeedbackRequest getDoctorFeedbackRequestDetail(String doctorFeedbackRequestNo) {
		logger.debug("DoctorFeedbackService_getDoctorFeedbackRequestDetail");
		return doctorFeedbackDao.getDoctorFeedbackRequestDetail(doctorFeedbackRequestNo);
	}
	public List<DoctorFeedbackResult> getDoctorFeedbackResultList() {
		logger.debug("DoctorFeedbackService_getDoctorFeedbackResultList");
		return doctorFeedbackDao.getDoctorFeedbackResultList();
	}
	public String selectForInsertFeedbackApproval(String doctorFeedbackRequestNo) {
		logger.debug("DoctorFeedbackService_doctorFeedbackRequestNo");
		//F는 등록 안되게 T는 등록할수잇는
		String result = "F";
		if(doctorFeedbackDao.selectForInsertFeedbackApproval(doctorFeedbackRequestNo) == 0 ) {
			result = "T";
		}
		return result;
	}
	public int addDoctorFeedbackApproval(String doctorFeedbackRequestNo, String approval) {
		logger.debug("DoctorFeedbackService_addDoctorFeedbackApproval");
		DoctorFeedbackApproval doctorFeedbackApproval = new DoctorFeedbackApproval();
		doctorFeedbackApproval.setDoctorFeedbackRequestNo(doctorFeedbackRequestNo);
		doctorFeedbackApproval.setDoctorFeedbackApproval(approval);
		return doctorFeedbackDao.addDoctorFeedbackApproval(doctorFeedbackApproval);
	}
	public List<MyDiseaseDetail> getMemberDiseaseListForFeedback(String memberNo) {
		logger.debug("DoctorFeedbackService_getMemberDiseaseListForFeedback");
		return doctorFeedbackDao.getMemberDiseaseListForFeedback(memberNo);
	}
	public int addDoctorFeedbackResult(DoctorFeedbackResult doctorFeedbackResult) {
		logger.debug("DoctorFeedbackService_addDoctorFeedbackResult");
		//의사피드백결과를 db에 저장후
		doctorFeedbackDao.addDoctorFeedbackResult(doctorFeedbackResult);
		//의사가 피드백을 완료햇으면 doctorFeedbackApproval테이블의 doctorFeedbackResult를 T로 바꾼다.
		DoctorFeedbackApproval doctorFeedbackApproval = new DoctorFeedbackApproval();
		doctorFeedbackApproval.setDoctorFeedbackResult("T");
		doctorFeedbackApproval.setDoctorFeedbackRequestNo(doctorFeedbackResult.getDoctorFeedbackRequestNo());
		
		return doctorFeedbackDao.updateDoctorFeedbackApproval(doctorFeedbackApproval);
	}
	public DoctorFeedbackRequest getDoctorFeedbackRequestedDetail(String doctorFeedbackRequestNo) {
		logger.debug("DoctorFeedbackService_getDoctorFeedbackRequestedDetail");
		return doctorFeedbackDao.getDoctorFeedbackRequestedDetail(doctorFeedbackRequestNo);
	}
	public List<DoctorFeedbackRequest> getDoctorFeedbackRequestedList() {
		logger.debug("DoctorFeedbackService_getDoctorFeedbackRequestedList");
		String sMemberNo = (String)session.getAttribute("memberSessionNo");
		return doctorFeedbackDao.getDoctorFeedbackRequestedList(sMemberNo);
	}
	public int removeDoctorFeedbackRequest(String doctorFeedbackRequestNo) {
		logger.debug("DoctorFeedbackService_removedoctorFeedbackRequest");
		return doctorFeedbackDao.removeDoctorFeedbackRequest(doctorFeedbackRequestNo);
	}
	public List<Disease> getDiseaseList() {
		logger.debug("DoctorFeedbackService_getDiseaseList");
		return doctorFeedbackDao.getDiseaseList();
	}
	public List<DoctorFeedbackRequest> getDoctorFeedbackRequestList() {
		logger.debug("DoctorFeedbackService_getDoctorFeedbackRequestList");
		String sMemberNo = (String)session.getAttribute("memberSessionNo");
		return doctorFeedbackDao.getDoctorFeedbackRequestList(sMemberNo);
	}
	public int doctorFeedbackRequest(DoctorFeedbackRequest doctorFeedbackRequest) {
		logger.debug("DoctorFeedbackService_doctorFeedbackRequest");
		int result = (doctorFeedbackDao.selectDoctorFeedbackRequestNo())+1;
		System.out.println("result : "+ result);
		String temp = "doctor_feedback_request_";
		String doctorFeedbackRequestNo = temp+result;
		doctorFeedbackRequest.setDoctorFeedbackRequestNo(doctorFeedbackRequestNo);
		
		return doctorFeedbackDao.doctorFeedbackRequest(doctorFeedbackRequest);
	}
	public List<DoctorMember> getDoctorList() {
		logger.debug("DoctorFeedbackService_getDoctorList");
		return doctorFeedbackDao.getDoctorList();
	}
}
