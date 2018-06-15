package com.cafe24.kyungsu93.diet.service;

public class ConsumeCalorie {
	private String consumeCalorieNo;
	private String memberNo;
	private String exerciseNo;
	private int consumeTime;
	private String consumeCalorieDate;
	private String exerciseName;
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
	public String getExerciseNo() {
		return exerciseNo;
	}
	public void setExerciseNo(String exerciseNo) {
		this.exerciseNo = exerciseNo;
	}
	public int getConsumeTime() {
		return consumeTime;
	}
	public void setConsumeTime(int consumeTime) {
		this.consumeTime = consumeTime;
	}
	public String getConsumeCalorieDate() {
		return consumeCalorieDate;
	}
	public void setConsumeCalorieDate(String consumeCalorieDate) {
		this.consumeCalorieDate = consumeCalorieDate;
	}
	public String getExerciseName() {
		return exerciseName;
	}
	public void setExerciseName(String exerciseName) {
		this.exerciseName = exerciseName;
	}
	@Override
	public String toString() {
		return "ConsumeCalorie [consumeCalorieNo=" + consumeCalorieNo + ", memberNo=" + memberNo + ", exerciseNo="
				+ exerciseNo + ", consumeTime=" + consumeTime + ", consumeCalorieDate=" + consumeCalorieDate
				+ ", exerciseName=" + exerciseName + "]";
	}
	
	
}
