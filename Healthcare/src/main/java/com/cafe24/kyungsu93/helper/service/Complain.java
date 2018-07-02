package com.cafe24.kyungsu93.helper.service;

import java.util.List;

public class Complain {
	private String complainNo;
	private String complainMemberNo;
	private String memberNo;
	private String complainTitle;
	private String complainContent;
	private String complainDate;
	private List<ComplainEvidenceFile> complainEvidenceFile;
	private String memberId;
	private int complainAnswerCount;
	
	public int getComplainAnswerCount() {
		return complainAnswerCount;
	}
	public void setComplainAnswerCount(int complainAnswerCount) {
		this.complainAnswerCount = complainAnswerCount;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getComplainNo() {
		return complainNo;
	}
	public void setComplainNo(String complainNo) {
		this.complainNo = complainNo;
	}
	public String getComplainMemberNo() {
		return complainMemberNo;
	}
	public void setComplainMemberNo(String complainMemberNo) {
		this.complainMemberNo = complainMemberNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getComplainTitle() {
		return complainTitle;
	}
	public void setComplainTitle(String complainTitle) {
		this.complainTitle = complainTitle;
	}
	public String getComplainContent() {
		return complainContent;
	}
	public void setComplainContent(String complainContent) {
		this.complainContent = complainContent;
	}
	public String getComplainDate() {
		return complainDate;
	}
	public void setComplainDate(String complainDate) {
		this.complainDate = complainDate;
	}
	public List<ComplainEvidenceFile> getComplainEvidenceFile() {
		return complainEvidenceFile;
	}
	public void setComplainEvidenceFile(List<ComplainEvidenceFile> complainEvidenceFile) {
		this.complainEvidenceFile = complainEvidenceFile;
	}
	@Override
	public String toString() {
		return "Complain [complainNo=" + complainNo + ", complainMemberNo=" + complainMemberNo + ", memberNo="
				+ memberNo + ", complainTitle=" + complainTitle + ", complainContent=" + complainContent
				+ ", complainDate=" + complainDate + ", complainEvidenceFile=" + complainEvidenceFile + ", memberId="
				+ memberId + ", complainAnswerCount=" + complainAnswerCount + "]";
	}

}
