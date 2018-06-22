package com.cafe24.kyungsu93.doctorfeedback.service;

public class DoctorFeedbackResult {
	private String doctorFeedbackResultNo;
	private String doctorFeedbackResultTitle;
	private String doctorFeedbackResultContent;
	private String doctorFeedbackResultDate;
	public String getDoctorFeedbackResultNo() {
		return doctorFeedbackResultNo;
	}
	public void setDoctorFeedbackResultNo(String doctorFeedbackResultNo) {
		this.doctorFeedbackResultNo = doctorFeedbackResultNo;
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
		return "DoctorFeedbackResult [doctorFeedbackResultNo=" + doctorFeedbackResultNo + ", doctorFeedbackResultTitle="
				+ doctorFeedbackResultTitle + ", doctorFeedbackResultContent=" + doctorFeedbackResultContent
				+ ", doctorFeedbackResultDate=" + doctorFeedbackResultDate + "]";
	}
	
}
