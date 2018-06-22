package com.cafe24.kyungsu93.helper.service;

public class Sanction {
	private String sanctionNo;
	private String sanctionMemberNo;
	private String sanctionKindNo;
	private String sanctionTitle;
	private String sanctionContent;
	private String sanctionStartDate;
	private String sanctionEndDate;
	private String sanctionDate;
	public String getSanctionNo() {
		return sanctionNo;
	}
	public void setSanctionNo(String sanctionNo) {
		this.sanctionNo = sanctionNo;
	}
	public String getSanctionMemberNo() {
		return sanctionMemberNo;
	}
	public void setSanctionMemberNo(String sanctionMemberNo) {
		this.sanctionMemberNo = sanctionMemberNo;
	}
	public String getSanctionKindNo() {
		return sanctionKindNo;
	}
	public void setSanctionKindNo(String sanctionKindNo) {
		this.sanctionKindNo = sanctionKindNo;
	}
	public String getSanctionTitle() {
		return sanctionTitle;
	}
	public void setSanctionTitle(String sanctionTitle) {
		this.sanctionTitle = sanctionTitle;
	}
	public String getSanctionContent() {
		return sanctionContent;
	}
	public void setSanctionContent(String sanctionContent) {
		this.sanctionContent = sanctionContent;
	}
	public String getSanctionStartDate() {
		return sanctionStartDate;
	}
	public void setSanctionStartDate(String sanctionStartDate) {
		this.sanctionStartDate = sanctionStartDate;
	}
	public String getSanctionEndDate() {
		return sanctionEndDate;
	}
	public void setSanctionEndDate(String sanctionEndDate) {
		this.sanctionEndDate = sanctionEndDate;
	}
	public String getSanctionDate() {
		return sanctionDate;
	}
	public void setSanctionDate(String sanctionDate) {
		this.sanctionDate = sanctionDate;
	}
	@Override
	public String toString() {
		return "Sanction [sanctionNo=" + sanctionNo + ", sanctionMemberNo=" + sanctionMemberNo + ", sanctionKindNo="
				+ sanctionKindNo + ", sanctionTitle=" + sanctionTitle + ", sanctionContent=" + sanctionContent
				+ ", sanctionStartDate=" + sanctionStartDate + ", sanctionEndDate=" + sanctionEndDate
				+ ", sanctionDate=" + sanctionDate + "]";
	}
	
	
}
