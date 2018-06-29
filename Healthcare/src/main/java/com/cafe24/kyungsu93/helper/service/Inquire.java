package com.cafe24.kyungsu93.helper.service;

public class Inquire {
	private String inquireNo;
	private String memberNo;
	private String inquireTitle;
	private String inquireContent;
	private String inquireDate;
	private String memberId;
	private int answerCount;

	public int getAnswerCount() {
		return answerCount;
	}
	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getInquireNo() {
		return inquireNo;
	}
	public void setInquireNo(String inquireNo) {
		this.inquireNo = inquireNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getInquireTitle() {
		return inquireTitle;
	}
	public void setInquireTitle(String inquireTitle) {
		this.inquireTitle = inquireTitle;
	}
	public String getInquireContent() {
		return inquireContent;
	}
	public void setInquireContent(String inquireContent) {
		this.inquireContent = inquireContent;
	}
	public String getInquireDate() {
		return inquireDate;
	}
	public void setInquireDate(String inquireDate) {
		this.inquireDate = inquireDate;
	}
	@Override
	public String toString() {
		return "Inquire [inquireNo=" + inquireNo + ", memberNo=" + memberNo + ", inquireTitle=" + inquireTitle
				+ ", inquireContent=" + inquireContent + ", inquireDate=" + inquireDate + ", memberId=" + memberId
				+ ", answerCount=" + answerCount + "]";
	}
	
}
