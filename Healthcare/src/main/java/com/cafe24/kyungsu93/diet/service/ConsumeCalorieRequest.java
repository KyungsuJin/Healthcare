package com.cafe24.kyungsu93.diet.service;

import java.util.List;

public class ConsumeCalorieRequest {
	private String consumeCalorieNo;
	private String memberNo;
	private List<String> exerciseNo;
	private List<Integer> consumeTime;
	private String consumeCalorieDate;
	public String getConsumeCalorieNo() {
		return consumeCalorieNo;
	}
	public void setConsumeCalorieNo(String consumeCalorieNo) {
		this.consumeCalorieNo = consumeCalorieNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public List<String> getExerciseNo() {
		return exerciseNo;
	}
	public void setExerciseNo(List<String> exerciseNo) {
		this.exerciseNo = exerciseNo;
	}
	public List<Integer> getConsumeTime() {
		return consumeTime;
	}
	public void setConsumeTime(List<Integer> consumeTime) {
		this.consumeTime = consumeTime;
	}
	public String getConsumeCalorieDate() {
		return consumeCalorieDate;
	}
	public void setConsumeCalorieDate(String consumeCalorieDate) {
		this.consumeCalorieDate = consumeCalorieDate;
	}
	@Override
	public String toString() {
		return "ConsumeCalorieRequest [consumeCalorieNo=" + consumeCalorieNo + ", memberNo=" + memberNo
				+ ", exerciseNo=" + exerciseNo + ", consumeTime=" + consumeTime + ", consumeCalorieDate="
				+ consumeCalorieDate + "]";
	}
	
	
}
