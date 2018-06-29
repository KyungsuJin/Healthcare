package com.cafe24.kyungsu93.doctorfeedback.service;

public class DoctorGoodExercise {
	private String doctorFeedbackRequestNo;
	private String diseaseNo;
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

	public String getExerciseNo() {
		return exerciseNo;
	}

	public void setExerciseNo(String exerciseNo) {
		this.exerciseNo = exerciseNo;
	}

	@Override
	public String toString() {
		return "DoctorGoodExercise [doctorFeedbackRequestNo=" + doctorFeedbackRequestNo + ", diseaseNo=" + diseaseNo
				+ ", exerciseNo=" + exerciseNo + "]";
	}
	
}
