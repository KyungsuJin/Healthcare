package com.cafe24.kyungsu93.diet.service;

public class TotalConsumeResponse {
	private String mamberNo;
	private int consumeTime;
	private String consumeCalorieDate;
	private String exerciseName;
	private int totalExerciseCalorie;
	public String getMamberNo() {
		return mamberNo;
	}
	public void setMamberNo(String mamberNo) {
		this.mamberNo = mamberNo;
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
	public int getTotalExerciseCalorie() {
		return totalExerciseCalorie;
	}
	public void setTotalExerciseCalorie(int totalExerciseCalorie) {
		this.totalExerciseCalorie = totalExerciseCalorie;
	}
	@Override
	public String toString() {
		return "TotalConsumeResponse [mamberNo=" + mamberNo + ", consumeTime=" + consumeTime + ", consumeCalorieDate="
				+ consumeCalorieDate + ", exerciseName=" + exerciseName + ", totalExerciseCalorie="
				+ totalExerciseCalorie + "]";
	}


	
	
}
