package com.cafe24.kyungsu93.doctorfeedback.service;

public class DoctorFeedbackResult {
	private String doctorFeedbackRequestNo;
	private String doctorFeedbackResultTitle;
	private String doctorFeedbackResultContent;
	private String doctorFeedbackResultDate;
	public String getDoctorFeedbackRequestNo() {
		return doctorFeedbackRequestNo;
	}
	public void setDoctorFeedbackRequestNo(String doctorFeedbackRequestNo) {
		this.doctorFeedbackRequestNo = doctorFeedbackRequestNo;
	}
	public String getDoctorFeedbackResultTitle() {
		return doctorFeedbackResultTitle;
	}
	public void setDoctorFeedbackResultTitle(String doctorFeedbackResultTitle) {
		this.doctorFeedbackResultTitle = doctorFeedbackResultTitle;
	}
	public String getDoctorFeedbackResultContent() {
		return doctorFeedbackResultContent;
	}
	public void setDoctorFeedbackResultContent(String doctorFeedbackResultContent) {
		this.doctorFeedbackResultContent = doctorFeedbackResultContent;
	}
	public String getDoctorFeedbackResultDate() {
		return doctorFeedbackResultDate;
	}
	public void setDoctorFeedbackResultDate(String doctorFeedbackResultDate) {
		this.doctorFeedbackResultDate = doctorFeedbackResultDate;
	}
	@Override
	public String toString() {
		return "DoctorFeedbackResult [doctorFeedbackRequestNo=" + doctorFeedbackRequestNo
				+ ", doctorFeedbackResultTitle=" + doctorFeedbackResultTitle + ", doctorFeedbackResultContent="
				+ doctorFeedbackResultContent + ", doctorFeedbackResultDate=" + doctorFeedbackResultDate + "]";
	}

	
}
