package com.cafe24.kyungsu93.exercise.service;

public class ExerciseRegistration {
	private String exerciseMatchingNo;
	private String memberNo;
	private String exerciseNo;
	private String exerciseMatchingTitle;
	private String exerciseMatchingContent;
	private String exerciseMatchingTime;
	private int exerciseMatchingCount;
	private String exerciseMatchingPlace;
	private String exerciseMatchingScheduleDate;
	private String exerciseMatchingDate;
	private String memberId;
	private String exerciseMatchingJoinMemberNo;
	
	
	
	
	public String getExerciseMatchingJoinMemberNo() {
		return exerciseMatchingJoinMemberNo;
	}
	public void setExerciseMatchingJoinMemberNo(String exerciseMatchingJoinMemberNo) {
		this.exerciseMatchingJoinMemberNo = exerciseMatchingJoinMemberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getExerciseMatchingNo() {
		return exerciseMatchingNo;
	}
	public void setExerciseMatchingNo(String exerciseMatchingNo) {
		this.exerciseMatchingNo = exerciseMatchingNo;
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
	public String getExerciseMatchingTitle() {
		return exerciseMatchingTitle;
	}
	public void setExerciseMatchingTitle(String exerciseMatchingTitle) {
		this.exerciseMatchingTitle = exerciseMatchingTitle;
	}
	public String getExerciseMatchingContent() {
		return exerciseMatchingContent;
	}
	public void setExerciseMatchingContent(String exerciseMatchingContent) {
		this.exerciseMatchingContent = exerciseMatchingContent;
	}
	public String getExerciseMatchingTime() {
		return exerciseMatchingTime;
	}
	public void setExerciseMatchingTime(String exerciseMatchingTime) {
		this.exerciseMatchingTime = exerciseMatchingTime;
	}
	public int getExerciseMatchingCount() {
		return exerciseMatchingCount;
	}
	public void setExerciseMatchingCount(int exerciseMatchingCount) {
		this.exerciseMatchingCount = exerciseMatchingCount;
	}
	public String getExerciseMatchingPlace() {
		return exerciseMatchingPlace;
	}
	public void setExerciseMatchingPlace(String exerciseMatchingPlace) {
		this.exerciseMatchingPlace = exerciseMatchingPlace;
	}
	public String getExerciseMatchingScheduleDate() {
		return exerciseMatchingScheduleDate;
	}
	public void setExerciseMatchingScheduleDate(String exerciseMatchingScheduleDate) {
		this.exerciseMatchingScheduleDate = exerciseMatchingScheduleDate;
	}
	public String getExerciseMatchingDate() {
		return exerciseMatchingDate;
	}
	public void setExerciseMatchingDate(String exerciseMatchingDate) {
		this.exerciseMatchingDate = exerciseMatchingDate;
	}
	@Override
	public String toString() {
		return "ExerciseRegistration [exerciseMatchingNo=" + exerciseMatchingNo + ", memberNo=" + memberNo
				+ ", exerciseNo=" + exerciseNo + ", exerciseMatchingTitle=" + exerciseMatchingTitle
				+ ", exerciseMatchingContent=" + exerciseMatchingContent + ", exerciseMatchingTime="
				+ exerciseMatchingTime + ", exerciseMatchingCount=" + exerciseMatchingCount + ", exerciseMatchingPlace="
				+ exerciseMatchingPlace + ", exerciseMatchingScheduleDate=" + exerciseMatchingScheduleDate
				+ ", exerciseMatchingDate=" + exerciseMatchingDate + "]";
	}
	
	
	

}
