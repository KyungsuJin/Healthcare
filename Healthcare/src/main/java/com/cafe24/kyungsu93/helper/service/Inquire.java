package com.cafe24.kyungsu93.helper.service;

public class Inquire {
	private String inqireNo;
	private String memberNo;
	private String inquireTitle;
	private String inquireContent;
	private String inquireDate;
	public String getInqireNo() {
		return inqireNo;
	}
	public void setInqireNo(String inqireNo) {
		this.inqireNo = inqireNo;
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
		return "Inquire [inqireNo=" + inqireNo + ", memberNo=" + memberNo + ", inquireTitle=" + inquireTitle
				+ ", inquireContent=" + inquireContent + ", inquireDate=" + inquireDate + "]";
	}
	
}
