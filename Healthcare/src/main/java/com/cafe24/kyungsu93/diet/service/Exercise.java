package com.cafe24.kyungsu93.diet.service;

public class Exercise {
	private String exerciseNo;
	private String exerciseName;
	private String exerciseCalorie;
	private String exerciseDate;
	
	public String getExerciseNo() {
		return exerciseNo;
	}
	public void setExerciseNo(String exerciseNo) {
		this.exerciseNo = exerciseNo;
	}
	public String getExerciseName() {
		return exerciseName;
	}
	public void setExerciseName(String exerciseName) {
		this.exerciseName = exerciseName;
	}
	public String getExerciseCalorie() {
		return exerciseCalorie;
	}
	public void setExerciseCalorie(String exerciseCalorie) {
		this.exerciseCalorie = exerciseCalorie;
	}
	public String getExerciseDate() {
		return exerciseDate;
	}
	public void setExerciseDate(String exerciseDate) {
		this.exerciseDate = exerciseDate;
	}
	@Override
	public String toString() {
		return "Exercise [exerciseNo=" + exerciseNo + ", exerciseName=" + exerciseName + ", exerciseCalorie="
				+ exerciseCalorie + ", exerciseDate=" + exerciseDate + "]";
	}
}
