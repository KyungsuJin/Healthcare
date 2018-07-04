package com.cafe24.kyungsu93.diet.service;

public class BodyMassIndexResponse {
	private String bodyMassIndexNo;
	private String memberNo;
	private Double bodyHeight;
	private Double bodyWeight;
	private Double bodyWaistSize;
	private Double bodyMassIndex;
	private String bodyDate;
	private String memberId;
		
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getBodyMassIndexNo() {
		return bodyMassIndexNo;
	}
	public void setBodyMassIndexNo(String bodyMassIndexNo) {
		this.bodyMassIndexNo = bodyMassIndexNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public Double getBodyHeight() {
		return bodyHeight;
	}
	public void setBodyHeight(Double bodyHeight) {
		this.bodyHeight = bodyHeight;
	}
	public Double getBodyWeight() {
		return bodyWeight;
	}
	public void setBodyWeight(Double bodyWeight) {
		this.bodyWeight = bodyWeight;
	}
	public Double getBodyWaistSize() {
		return bodyWaistSize;
	}
	public void setBodyWaistSize(Double bodyWaistSize) {
		this.bodyWaistSize = bodyWaistSize;
	}
	public Double getBodyMassIndex() {
		return bodyMassIndex;
	}
	public void setBodyMassIndex(Double bodyMassIndex) {
		this.bodyMassIndex = bodyMassIndex;
	}
	public String getBodyDate() {
		return bodyDate;
	}
	public void setBodyDate(String bodyDate) {
		this.bodyDate = bodyDate;
	}
	@Override
	public String toString() {
		return "BodyMassIndexResponse [bodyMassIndexNo=" + bodyMassIndexNo + ", memberNo=" + memberNo + ", bodyHeight="
				+ bodyHeight + ", bodyWeight=" + bodyWeight + ", bodyWaistSize=" + bodyWaistSize + ", bodyMassIndex="
				+ bodyMassIndex + ", bodyDate=" + bodyDate + ", memberId=" + memberId + "]";
	}
	
	
}
