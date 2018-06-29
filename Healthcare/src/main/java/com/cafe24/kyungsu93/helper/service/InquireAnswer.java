package com.cafe24.kyungsu93.helper.service;

public class InquireAnswer {
	private String inquireNo;
	private String memberNo;
	private String inquireAnswerTitle;
	private String inquireAnswerContent;
	private String inquireAnswerdate;
	private String inquireTitle;	
	
	public String getInquireTitle() {
		return inquireTitle;
	}
	public void setInquireTitle(String inquireTitle) {
		this.inquireTitle = inquireTitle;
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
	public String getInquireAnswerTitle() {
		return inquireAnswerTitle;
	}
	public void setInquireAnswerTitle(String inquireAnswerTitle) {
		this.inquireAnswerTitle = inquireAnswerTitle;
	}
	public String getInquireAnswerContent() {
		return inquireAnswerContent;
	}
	public void setInquireAnswerContent(String inquireAnswerContent) {
		this.inquireAnswerContent = inquireAnswerContent;
	}
	public String getInquireAnswerdate() {
		return inquireAnswerdate;
	}
	public void setInquireAnswerdate(String inquireAnswerdate) {
		this.inquireAnswerdate = inquireAnswerdate;
	}
	@Override
	public String toString() {
		return "InquireAnswer [inquireNo=" + inquireNo + ", memberNo=" + memberNo + ", inquireAnswerTitle="
				+ inquireAnswerTitle + ", inquireAnswerContent=" + inquireAnswerContent + ", inquireAnswerdate="
				+ inquireAnswerdate + ", inquireTitle=" + inquireTitle + "]";
	}
	
	
}
