package com.cafe24.kyungsu93.doctorfeedback.service;

public class DoctorFeedbackEvaluation {
	private String doctorFeedbackRequestNo;
	private int doctorFeedbackEvaluationGrade;
	private int doctorFeedbackEvaluationDate;
	public String getDoctorFeedbackRequestNo() {
		return doctorFeedbackRequestNo;
	}
	public void setDoctorFeedbackRequestNo(String doctorFeedbackRequestNo) {
		this.doctorFeedbackRequestNo = doctorFeedbackRequestNo;
	}
	public int getDoctorFeedbackEvaluationGrade() {
		return doctorFeedbackEvaluationGrade;
	}
	public void setDoctorFeedbackEvaluationGrade(int doctorFeedbackEvaluationGrade) {
		this.doctorFeedbackEvaluationGrade = doctorFeedbackEvaluationGrade;
	}
	public int getDoctorFeedbackEvaluationDate() {
		return doctorFeedbackEvaluationDate;
	}
	public void setDoctorFeedbackEvaluationDate(int doctorFeedbackEvaluationDate) {
		this.doctorFeedbackEvaluationDate = doctorFeedbackEvaluationDate;
	}
	@Override
	public String toString() {
		return "DoctorFeedbackEvaluation [doctorFeedbackRequestNo=" + doctorFeedbackRequestNo
				+ ", doctorFeedbackEvaluationGrade=" + doctorFeedbackEvaluationGrade + ", doctorFeedbackEvaluationDate="
				+ doctorFeedbackEvaluationDate + "]";
	}
	
}
