package com.cafe24.kyungsu93.doctorfeedback.service;

public class DoctorGoodFood {
	private String doctorFeedbackRequestNo;
	private String diseaseNo;
	private String foodNo;
	private String exerciseNo;
	public String getDoctorFeedbackRequestNo() {
		return doctorFeedbackRequestNo;
	}
	public void setDoctorFeedbackRequestNo(String doctorFeedbackRequestNo) {
		this.doctorFeedbackRequestNo = doctorFeedbackRequestNo;
	}
	public String getDiseaseNo() {
		return diseaseNo;
	}
	public void setDiseaseNo(String diseaseNo) {
		this.diseaseNo = diseaseNo;
	}
	public String getFoodNo() {
		return foodNo;
	}
	public void setFoodNo(String foodNo) {
		this.foodNo = foodNo;
	}
	public String getExerciseNo() {
		return exerciseNo;
	}
	public void setExerciseNo(String exerciseNo) {
		this.exerciseNo = exerciseNo;
	}
	@Override
	public String toString() {
		return "DoctorGoodFood [doctorFeedbackRequestNo=" + doctorFeedbackRequestNo + ", diseaseNo=" + diseaseNo
				+ ", foodNo=" + foodNo + ", exerciseNo=" + exerciseNo + "]";
	}
	
}
