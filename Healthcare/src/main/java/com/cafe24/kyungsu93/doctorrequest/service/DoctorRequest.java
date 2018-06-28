package com.cafe24.kyungsu93.doctorrequest.service;

public class DoctorRequest {

	private String requestHealthInformationNo;
	private String teacherNo;
	private String memberNo;
	private String requestTitle;
	private String requestContent;
	private String requestDate;
	private String requestExpire_Date;
	private String requestApproval;
	private String requestApprovalDate;
	public String getRequestHealthInformationNo() {
		return requestHealthInformationNo;
	}
	public void setRequestHealthInformationNo(String requestHealthInformationNo) {
		this.requestHealthInformationNo = requestHealthInformationNo;
	}
	public String getTeacherNo() {
		return teacherNo;
	}
	public void setTeacherNo(String teacherNo) {
		this.teacherNo = teacherNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getRequestTitle() {
		return requestTitle;
	}
	public void setRequestTitle(String requestTitle) {
		this.requestTitle = requestTitle;
	}
	public String getRequestContent() {
		return requestContent;
	}
	public void setRequestContent(String requestContent) {
		this.requestContent = requestContent;
	}
	public String getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}
	public String getRequestExpire_Date() {
		return requestExpire_Date;
	}
	public void setRequestExpire_Date(String requestExpire_Date) {
		this.requestExpire_Date = requestExpire_Date;
	}
	public String getRequestApproval() {
		return requestApproval;
	}
	public void setRequestApproval(String requestApproval) {
		this.requestApproval = requestApproval;
	}
	public String getRequestApprovalDate() {
		return requestApprovalDate;
	}
	public void setRequestApprovalDate(String requestApprovalDate) {
		this.requestApprovalDate = requestApprovalDate;
	}
	@Override
	public String toString() {
		return "DoctorRequest [requestHealthInformationNo=" + requestHealthInformationNo + ", teacherNo=" + teacherNo
				+ ", memberNo=" + memberNo + ", requestTitle=" + requestTitle + ", requestContent=" + requestContent
				+ ", requestDate=" + requestDate + ", requestExpire_Date=" + requestExpire_Date + ", requestApproval="
				+ requestApproval + ", requestApprovalDate=" + requestApprovalDate + "]";
	}

}