package com.cafe24.kyungsu93.diet.service;

public class IngestCalorie {
	private String ingestCalorieNo;
	private String memberNo;
	private String foodNo;
	private int ingestWeight;
	private String ingestCalorieDate;
	private String foodName;
	
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
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
	public int getIngestWeight() {
		return ingestWeight;
	}
	public void setIngestWeight(int ingestWeight) {
		this.ingestWeight = ingestWeight;
	}
	public String getIngestCalorieDate() {
		return ingestCalorieDate;
	}
	public void setIngestCalorieDate(String ingestCalorieDate) {
		this.ingestCalorieDate = ingestCalorieDate;
	}
	public String getFoodNo() {
		return foodNo;
	}
	public void setFoodNo(String foodNo) {
		this.foodNo = foodNo;
	}
	
	@Override
	public String toString() {
		return "IngestCalorie [ingestCalorieNo=" + ingestCalorieNo + ", memberNo=" + memberNo + ", foodNo=" + foodNo
				+ ", ingestWeight=" + ingestWeight + ", ingestCalorieDate=" + ingestCalorieDate + ", foodName="
				+ foodName + "]";
	}
	
}
