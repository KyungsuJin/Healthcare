package com.cafe24.kyungsu93.healthsurvey.service;

public class HealthSurveyResponse {
	private String healthSurveyRegisterNo;
	private String memberName;
	private String diseaseName;
	private double surveyGrade;
	private int peopleNumber;
	private String healthSurveyRegisterTitle;
	private String healthSurveyRegisterContent;
	private int healthSurveyPoint;
	private int healthSurveyRegisterCount;
	private String healthSurveyRegisterDate;
	
	public String getHealthSurveyRegisterNo() {
		return healthSurveyRegisterNo;
	}
	public void setHealthSurveyRegisterNo(String healthSurveyRegisterNo) {
		this.healthSurveyRegisterNo = healthSurveyRegisterNo;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getDiseaseName() {
		return diseaseName;
	}
	public void setDiseaseName(String diseaseName) {
		this.diseaseName = diseaseName;
	}
	public double getSurveyGrade() {
		return surveyGrade;
	}
	public void setSurveyGrade(double surveyGrade) {
		this.surveyGrade = surveyGrade;
	}
	public int getPeopleNumber() {
		return peopleNumber;
	}
	public void setPeopleNumber(int peopleNumber) {
		this.peopleNumber = peopleNumber;
	}
	public String getHealthSurveyRegisterTitle() {
		return healthSurveyRegisterTitle;
	}
	public void setHealthSurveyRegisterTitle(String healthSurveyRegisterTitle) {
		this.healthSurveyRegisterTitle = healthSurveyRegisterTitle;
	}
	public String getHealthSurveyRegisterContent() {
		return healthSurveyRegisterContent;
	}
	public void setHealthSurveyRegisterContent(String healthSurveyRegisterContent) {
		this.healthSurveyRegisterContent = healthSurveyRegisterContent;
	}
	public int getHealthSurveyPoint() {
		return healthSurveyPoint;
	}
	public void setHealthSurveyPoint(int healthSurveyPoint) {
		this.healthSurveyPoint = healthSurveyPoint;
	}
	public int getHealthSurveyRegisterCount() {
		return healthSurveyRegisterCount;
	}
	public void setHealthSurveyRegisterCount(int healthSurveyRegisterCount) {
		this.healthSurveyRegisterCount = healthSurveyRegisterCount;
	}
	public String getHealthSurveyRegisterDate() {
		return healthSurveyRegisterDate;
	}
	public void setHealthSurveyRegisterDate(String healthSurveyRegisterDate) {
		this.healthSurveyRegisterDate = healthSurveyRegisterDate;
	}
	@Override
	public String toString() {
		return "HealthSurveyResponse [healthSurveyRegisterNo=" + healthSurveyRegisterNo + ", memberName=" + memberName
				+ ", diseaseName=" + diseaseName + ", surveyGrade=" + surveyGrade + ", peopleNumber=" + peopleNumber
				+ ", healthSurveyRegisterTitle=" + healthSurveyRegisterTitle + ", healthSurveyRegisterContent="
				+ healthSurveyRegisterContent + ", healthSurveyPoint=" + healthSurveyPoint
				+ ", healthSurveyRegisterCount=" + healthSurveyRegisterCount + ", healthSurveyRegisterDate="
				+ healthSurveyRegisterDate + "]";
	}
	
}
