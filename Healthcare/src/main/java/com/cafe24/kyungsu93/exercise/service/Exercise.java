package com.cafe24.kyungsu93.exercise.service;

public class Exercise {
	private String exerciseMatchingNo;
	private String registrationNo;
	private String memberNo;
	private String exerciseMatchingRegistrationDate;
	
	
	
	
	public String getExerciseMatchingRegistrationDate() {
		return exerciseMatchingRegistrationDate;
	}

	public void setExerciseMatchingRegistrationDate(String exerciseMatchingRegistrationDate) {
		this.exerciseMatchingRegistrationDate = exerciseMatchingRegistrationDate;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getRegistrationNo() {
		return registrationNo;
	}

	public void setRegistrationNo(String registrationNo) {
		this.registrationNo = registrationNo;
	}

	public String getExerciseMatchingNo() {
		return exerciseMatchingNo;
	}

	public void setExerciseMatchingNo(String exerciseMatchingNo) {
		this.exerciseMatchingNo = exerciseMatchingNo;
	}

	@Override
	public String toString() {
		return "Exercise [exerciseMatchingNo=" + exerciseMatchingNo + ", registrationNo=" + registrationNo
				+ ", memberNo=" + memberNo + ", exerciseMatchingRegistrationDate=" + exerciseMatchingRegistrationDate
				+ "]";
	}
	
	

}
