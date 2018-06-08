package com.cafe24.kyungsu93.diet.service;

public class IngestCalorie {
	private String ingestCalorieNo;
	private String memberNo;
	private String exerciseNo;
	private int ingestWeight;
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
	public String getExerciseNo() {
		return exerciseNo;
	}
	public void setExerciseNo(String exerciseNo) {
		this.exerciseNo = exerciseNo;
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
	@Override
	public String toString() {
		return "IngestCalorie [ingestCalorieNo=" + ingestCalorieNo + ", memberNo=" + memberNo + ", exerciseNo="
				+ exerciseNo + ", ingestWeight=" + ingestWeight + ", ingestCalorieDate=" + ingestCalorieDate + "]";
	}
	
	
}
