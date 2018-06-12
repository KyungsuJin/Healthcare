package com.cafe24.kyungsu93.diet.service;

import java.util.List;

public class IngestCalorieRequest {
	private String ingestCalorieNo;
	private String memberNo;
	private List<String> foodNo;
	private List<Integer> ingestWeight;
	private String ingestCalorieDate;
	
	public String getIngestCalorieNo() {
		return ingestCalorieNo;
	}
	public void setIngestCalorieNo(String ingestCalorieNo) {
		this.ingestCalorieNo = ingestCalorieNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public List<String> getFoodNo() {
		return foodNo;
	}
	public void setFoodNo(List<String> foodNo) {
		this.foodNo = foodNo;
	}
	public List<Integer> getIngestWeight() {
		return ingestWeight;
	}
	public void setIngestWeight(List<Integer> ingestWeight) {
		this.ingestWeight = ingestWeight;
	}
	public String getIngestCalorieDate() {
		return ingestCalorieDate;
	}
	public void setIngestCalorieDate(String ingestCalorieDate) {
		this.ingestCalorieDate = ingestCalorieDate;
	}
	@Override
	public String toString() {
		return "IngestCalorieRequest [ingestCalorieNo=" + ingestCalorieNo + ", memberNo=" + memberNo + ", foodNo="
				+ foodNo + ", ingestWeight=" + ingestWeight + ", ingestCalorieDate=" + ingestCalorieDate + "]";
	}
	
}
