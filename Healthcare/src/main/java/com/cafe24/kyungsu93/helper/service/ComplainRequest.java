package com.cafe24.kyungsu93.helper.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ComplainRequest {
	private String complainNo;
	private String complainMemberNo;
	private String memberNo;
	private String complainTitle;
	private String complainContent;
	private String complainDate;
	private List<MultipartFile> multipartFile;
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
	public List<MultipartFile> getMultipartFile() {
		return multipartFile;
	}
	public void setMultipartFile(List<MultipartFile> multipartFile) {
		this.multipartFile = multipartFile;
	}
	@Override
	public String toString() {
		return "ComplainRequest [complainNo=" + complainNo + ", complainMemberNo=" + complainMemberNo + ", memberNo="
				+ memberNo + ", complainTitle=" + complainTitle + ", complainContent=" + complainContent
				+ ", complainDate=" + complainDate + ", multipartFile=" + multipartFile + "]";
	}

}
