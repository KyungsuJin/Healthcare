package com.cafe24.kyungsu93.doctorfeedback.service;

public class DoctorFeedbackRequest {
	private String doctorFeedbackRequestNo;
	private String memberNo;
	private String doctorNo;
	private String diseaseNo;
	private String diseaseName;
	private String doctorFeedbackRequestTitle;
	private String doctorFeedbackRequestContent;
	private String doctorFeedbackRequestDate;
	private String doctorFeedbackApproval;
	private String doctorFeedbackresult;
	
	public String getDoctorFeedbackApproval() {
		return doctorFeedbackApproval;
	}
	public void setDoctorFeedbackApproval(String doctorFeedbackApproval) {
		this.doctorFeedbackApproval = doctorFeedbackApproval;
	}
	public String getDoctorFeedbackresult() {
		return doctorFeedbackresult;
	}
	public void setDoctorFeedbackresult(String doctorFeedbackresult) {
		this.doctorFeedbackresult = doctorFeedbackresult;
	}
	public String getDiseaseName() {
		return diseaseName;
	}
	public void setDiseaseName(String diseaseName) {
		this.diseaseName = diseaseName;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getDoctorNo() {
		return doctorNo;
	}
	public void setDoctorNo(String doctorNo) {
		this.doctorNo = doctorNo;
	}
	public String getDiseaseNo() {
		return diseaseNo;
	}
	public void setDiseaseNo(String diseaseNo) {
		this.diseaseNo = diseaseNo;
	}
	public String getDoctorFeedbackRequestTitle() {
		return doctorFeedbackRequestTitle;
	}
	public void setDoctorFeedbackRequestTitle(String doctorFeedbackRequestTitle) {
		this.doctorFeedbackRequestTitle = doctorFeedbackRequestTitle;
	}
	public String getDoctorFeedbackRequestContent() {
		return doctorFeedbackRequestContent;
	}
	public void setDoctorFeedbackRequestContent(String doctorFeedbackRequestContent) {
		this.doctorFeedbackRequestContent = doctorFeedbackRequestContent;
	}
	public String getDoctorFeedbackRequestDate() {
		return doctorFeedbackRequestDate;
	}
	public void setDoctorFeedbackRequestDate(String doctorFeedbackRequestDate) {
		this.doctorFeedbackRequestDate = doctorFeedbackRequestDate;
	}
	public String getDoctorFeedbackRequestNo() {
		return doctorFeedbackRequestNo;
	}
	public void setDoctorFeedbackRequestNo(String doctorFeedbackRequestNo) {
		this.doctorFeedbackRequestNo = doctorFeedbackRequestNo;
	}
	@Override
	public String toString() {
		return "DoctorFeedbackRequest [doctorFeedbackRequestNo=" + doctorFeedbackRequestNo + ", memberNo=" + memberNo
				+ ", doctorNo=" + doctorNo + ", diseaseNo=" + diseaseNo + ", diseaseName=" + diseaseName
				+ ", doctorFeedbackRequestTitle=" + doctorFeedbackRequestTitle + ", doctorFeedbackRequestContent="
				+ doctorFeedbackRequestContent + ", doctorFeedbackRequestDate=" + doctorFeedbackRequestDate
				+ ", doctorFeedbackApproval=" + doctorFeedbackApproval + ", doctorFeedbackresult="
				+ doctorFeedbackresult + "]";
	}

	
	
}
