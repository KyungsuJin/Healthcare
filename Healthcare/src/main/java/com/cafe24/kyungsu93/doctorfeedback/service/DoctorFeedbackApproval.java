package com.cafe24.kyungsu93.doctorfeedback.service;

public class DoctorFeedbackApproval {
	
	private String doctorFeedbackRequestNo;
	private String doctorFeedbackApproval;
	private String doctorFeedbackResult;
	private String doctorFeedbackApprovalDate;
	public String getDoctorFeedbackRequestNo() {
		return doctorFeedbackRequestNo;
	}
	public void setDoctorFeedbackRequestNo(String doctorFeedbackRequestNo) {
		this.doctorFeedbackRequestNo = doctorFeedbackRequestNo;
	}
	public String getDoctorFeedbackApproval() {
		return doctorFeedbackApproval;
	}
	public void setDoctorFeedbackApproval(String doctorFeedbackApproval) {
		this.doctorFeedbackApproval = doctorFeedbackApproval;
	}
	public String getDoctorFeedbackResult() {
		return doctorFeedbackResult;
	}
	public void setDoctorFeedbackResult(String doctorFeedbackResult) {
		this.doctorFeedbackResult = doctorFeedbackResult;
	}
	public String getDoctorFeedbackApprovalDate() {
		return doctorFeedbackApprovalDate;
	}
	public void setDoctorFeedbackApprovalDate(String doctorFeedbackApprovalDate) {
		this.doctorFeedbackApprovalDate = doctorFeedbackApprovalDate;
	}
	@Override
	public String toString() {
		return "DoctorFeedbackApproval [doctorFeedbackRequestNo=" + doctorFeedbackRequestNo
				+ ", doctorFeedbackApproval=" + doctorFeedbackApproval + ", doctorFeedbackResult="
				+ doctorFeedbackResult + ", doctorFeedbackApprovalDate=" + doctorFeedbackApprovalDate + "]";
	}
	

	
}
