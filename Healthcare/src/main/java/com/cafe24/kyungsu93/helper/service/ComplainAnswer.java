package com.cafe24.kyungsu93.helper.service;

public class ComplainAnswer {
	private String complainNo;
	private String memberNo;
	private String complainAnswerTitle;
	private String complainAnswerContent;
	private String complainAnswerDate;
	private String complainTitle;

	public String getComplainTitle() {
		return complainTitle;
	}
	public void setComplainTitle(String complainTitle) {
		this.complainTitle = complainTitle;
	}
	public String getComplainNo() {
		return complainNo;
	}
	public void setComplainNo(String complainNo) {
		this.complainNo = complainNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getComplainAnswerTitle() {
		return complainAnswerTitle;
	}
	public void setComplainAnswerTitle(String complainAnswerTitle) {
		this.complainAnswerTitle = complainAnswerTitle;
	}
	public String getComplainAnswerContent() {
		return complainAnswerContent;
	}
	public void setComplainAnswerContent(String complainAnswerContent) {
		this.complainAnswerContent = complainAnswerContent;
	}
	public String getComplainAnswerDate() {
		return complainAnswerDate;
	}
	public void setComplainAnswerDate(String complainAnswerDate) {
		this.complainAnswerDate = complainAnswerDate;
	}
	@Override
	public String toString() {
		return "ComplainAnswer [complainNo=" + complainNo + ", memberNo=" + memberNo + ", complainAnswerTitle="
				+ complainAnswerTitle + ", complainAnswerContent=" + complainAnswerContent + ", complainAnswerDate="
				+ complainAnswerDate + ", complainTitle=" + complainTitle + "]";
	}
	
}
