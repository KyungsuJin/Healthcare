package com.cafe24.kyungsu93.healthsurvey.service;

public class HealthSurveyRecord {
	private String healthSurveyResultNo;
	private String healthSurveySelectionNo;
	
	public String getHealthSurveyResultNo() {
		return healthSurveyResultNo;
	}
	public void setHealthSurveyResultNo(String healthSurveyResultNo) {
		this.healthSurveyResultNo = healthSurveyResultNo;
	}
	public String getHealthSurveySelectionNo() {
		return healthSurveySelectionNo;
	}
	public void setHealthSurveySelectionNo(String healthSurveySelectionNo) {
		this.healthSurveySelectionNo = healthSurveySelectionNo;
	}
	@Override
	public String toString() {
		return "HealthSurveyRecord [healthSurveyResultNo=" + healthSurveyResultNo + ", healthSurveySelectionNo="
				+ healthSurveySelectionNo + "]";
	}
}
