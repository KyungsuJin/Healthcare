package com.cafe24.kyungsu93.healthsurvey.service;

public class HealthSurveyAverageGrade {
	private String healthSurveyRegisterNo;
	private int healthSurveyEvaluationAverageGrade;
	private int healthSurveyPeopleNumber;
	
	public String getHealthSurveyRegisterNo() {
		return healthSurveyRegisterNo;
	}
	public void setHealthSurveyRegisterNo(String healthSurveyRegisterNo) {
		this.healthSurveyRegisterNo = healthSurveyRegisterNo;
	}
	public int getHealthSurveyEvaluationAverageGrade() {
		return healthSurveyEvaluationAverageGrade;
	}
	public void setHealthSurveyEvaluationAverageGrade(int healthSurveyEvaluationAverageGrade) {
		this.healthSurveyEvaluationAverageGrade = healthSurveyEvaluationAverageGrade;
	}
	public int getHealthSurveyPeopleNumber() {
		return healthSurveyPeopleNumber;
	}
	public void setHealthSurveyPeopleNumber(int healthSurveyPeopleNumber) {
		this.healthSurveyPeopleNumber = healthSurveyPeopleNumber;
	}
	@Override
	public String toString() {
		return "HealthSurveyAverageGrade [healthSurveyRegisterNo=" + healthSurveyRegisterNo
				+ ", healthSurveyEvaluationAverageGrade=" + healthSurveyEvaluationAverageGrade
				+ ", healthSurveyPeopleNumber=" + healthSurveyPeopleNumber + "]";
	}
	
}
