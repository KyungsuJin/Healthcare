package com.cafe24.kyungsu93.healthsurvey.service;

public class HealthSurveyTotalGrade {
	private String healthSurveyResultNo;
	private int healthSurveyTotalGrade;
	
	public String getHealthSurveyResultNo() {
		return healthSurveyResultNo;
	}
	public void setHealthSurveyResultNo(String healthSurveyResultNo) {
		this.healthSurveyResultNo = healthSurveyResultNo;
	}
	public int getHealthSurveyTotalGrade() {
		return healthSurveyTotalGrade;
	}
	public void setHealthSurveyTotalGrade(int healthSurveyTotalGrade) {
		this.healthSurveyTotalGrade = healthSurveyTotalGrade;
	}
	@Override
	public String toString() {
		return "HealthSurveyTotalGrade [healthSurveyResultNo=" + healthSurveyResultNo + ", healthSurveyTotalGrade="
				+ healthSurveyTotalGrade + "]";
	}
}
