package com.cafe24.kyungsu93.doctorrequest.service;

public class DoctorRequest {

	private String RequestHealthInformationNo;
	private String TeacherNo;
	private String MemberNo;
	private String RequestTitle;
	private String RequestContent;
	private String RequestDate;
	public String getRequestHealthInformationNo() {
		return RequestHealthInformationNo;
	}
	public void setRequestHealthInformationNo(String requestHealthInformationNo) {
		RequestHealthInformationNo = requestHealthInformationNo;
	}
	public String getTeacherNo() {
		return TeacherNo;
	}
	public void setTeacherNo(String teacherNo) {
		TeacherNo = teacherNo;
	}
	public String getMemberNo() {
		return MemberNo;
	}
	public void setMemberNo(String memberNo) {
		MemberNo = memberNo;
	}
	public String getRequestTitle() {
		return RequestTitle;
	}
	public void setRequestTitle(String requestTitle) {
		RequestTitle = requestTitle;
	}
	public String getRequestContent() {
		return RequestContent;
	}
	public void setRequestContent(String requestContent) {
		RequestContent = requestContent;
	}
	public String getRequestDate() {
		return RequestDate;
	}
	public void setRequestDate(String requestDate) {
		RequestDate = requestDate;
	}
	@Override
	public String toString() {
		return "DoctorRequest [RequestHealthInformationNo=" + RequestHealthInformationNo + ", TeacherNo=" + TeacherNo
				+ ", MemberNo=" + MemberNo + ", RequestTitle=" + RequestTitle + ", RequestContent=" + RequestContent
				+ ", RequestDate=" + RequestDate + "]";
	}
}
