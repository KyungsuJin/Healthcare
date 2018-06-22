package com.cafe24.kyungsu93.doctorfeedback.service;

public class DoctorMember {
	private String memberNo;
	private String memberName;
	private String memberRegisterNo;
	private String memberHospitalName;
	private String treatment_department;
	private int memberTotalFeedback;
	private int memberAgreeFeedback;
	private String memberJoinApproval;
	private Double evaluationAverageGrade;
	private String feedbackAvailablilty;
	private String memberApprovalDate;
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberRegisterNo() {
		return memberRegisterNo;
	}
	public void setMemberRegisterNo(String memberRegisterNo) {
		this.memberRegisterNo = memberRegisterNo;
	}
	public String getMemberHospitalName() {
		return memberHospitalName;
	}
	public void setMemberHospitalName(String memberHospitalName) {
		this.memberHospitalName = memberHospitalName;
	}
	public String getTreatment_department() {
		return treatment_department;
	}
	public void setTreatment_department(String treatment_department) {
		this.treatment_department = treatment_department;
	}
	public int getMemberTotalFeedback() {
		return memberTotalFeedback;
	}
	public void setMemberTotalFeedback(int memberTotalFeedback) {
		this.memberTotalFeedback = memberTotalFeedback;
	}
	public int getMemberAgreeFeedback() {
		return memberAgreeFeedback;
	}
	public void setMemberAgreeFeedback(int memberAgreeFeedback) {
		this.memberAgreeFeedback = memberAgreeFeedback;
	}
	public String getMemberJoinApproval() {
		return memberJoinApproval;
	}
	public void setMemberJoinApproval(String memberJoinApproval) {
		this.memberJoinApproval = memberJoinApproval;
	}
	public Double getEvaluationAverageGrade() {
		return evaluationAverageGrade;
	}
	public void setEvaluationAverageGrade(Double evaluationAverageGrade) {
		this.evaluationAverageGrade = evaluationAverageGrade;
	}
	public String getFeedbackAvailablilty() {
		return feedbackAvailablilty;
	}
	public void setFeedbackAvailablilty(String feedbackAvailablilty) {
		this.feedbackAvailablilty = feedbackAvailablilty;
	}
	public String getMemberApprovalDate() {
		return memberApprovalDate;
	}
	public void setMemberApprovalDate(String memberApprovalDate) {
		this.memberApprovalDate = memberApprovalDate;
	}
	@Override
	public String toString() {
		return "DoctorMember [memberNo=" + memberNo + ", memberName=" + memberName + ", memberRegisterNo="
				+ memberRegisterNo + ", memberHospitalName=" + memberHospitalName + ", treatment_department="
				+ treatment_department + ", memberTotalFeedback=" + memberTotalFeedback + ", memberAgreeFeedback="
				+ memberAgreeFeedback + ", memberJoinApproval=" + memberJoinApproval + ", evaluationAverageGrade="
				+ evaluationAverageGrade + ", feedbackAvailablilty=" + feedbackAvailablilty + ", memberApprovalDate="
				+ memberApprovalDate + "]";
	}
	
	
}
