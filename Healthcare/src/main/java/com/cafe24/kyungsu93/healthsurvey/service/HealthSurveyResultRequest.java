package com.cafe24.kyungsu93.healthsurvey.service;

public class HealthSurveyResultRequest {
	private String healthSurveyResultNo;
	private String healthSurveyRegisterNo;
	private String memberNo;
	
	public String getHealthSurveyResultNo() {
		return healthSurveyResultNo;
	}
	public void setHealthSurveyResultNo(String healthSurveyResultNo) {
		this.healthSurveyResultNo = healthSurveyResultNo;
	}
	public String getHealthSurveyRegisterNo() {
		return healthSurveyRegisterNo;
	}
	public void setHealthSurveyRegisterNo(String healthSurveyRegisterNo) {
		this.healthSurveyRegisterNo = healthSurveyRegisterNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "HealthSurveyResult [healthSurveyResultNo=" + healthSurveyResultNo + ", healthSurveyRegisterNo="
				+ healthSurveyRegisterNo + ", memberNo=" + memberNo + "]";
	}
	
}
