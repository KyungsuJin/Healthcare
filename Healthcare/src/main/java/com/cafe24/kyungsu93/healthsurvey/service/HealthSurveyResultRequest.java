package com.cafe24.kyungsu93.healthsurvey.service;

public class HealthSurveyResultRequest {
	private String healthSurveyResultNo;
	private String healthSurveyRegisterNo;
	private int healthSurveyEvaluationDo;
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
	public int getHealthSurveyEvaluationDo() {
		return healthSurveyEvaluationDo;
	}
	public void setHealthSurveyEvaluationDo(int healthSurveyEvaluationDo) {
		this.healthSurveyEvaluationDo = healthSurveyEvaluationDo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "HealthSurveyResultRequest [healthSurveyResultNo=" + healthSurveyResultNo + ", healthSurveyRegisterNo="
				+ healthSurveyRegisterNo + ", healthSurveyEvaluationDo=" + healthSurveyEvaluationDo + ", memberNo="
				+ memberNo + "]";
	}
	
}
