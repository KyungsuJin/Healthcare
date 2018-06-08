package com.cafe24.kyungsu93.healthsurvey.service;

public class HealthSurveyResultResponse {
	private String healthSurveyResultNo;
	private String healthSurveyRegisterNo;
	private String healthSurveyResultDate;
	private int healthSurveyTotalGrade;
	private String memberName;
	private String diseaseName;
	private String healthSurveyRegisterTitle;
	private String healthSurveyRegisterContent;
	private int healthSurveyRegisterNormal;
	private int healthSurveyRegisterWarning;
	private int healthSurveyRegisterDanger;
	private int healthSurveyRegisterTotal;
	private int healthSurveyRegisterDate;
	
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
	public String getHealthSurveyResultDate() {
		return healthSurveyResultDate;
	}
	public void setHealthSurveyResultDate(String healthSurveyResultDate) {
		this.healthSurveyResultDate = healthSurveyResultDate;
	}
	public int getHealthSurveyTotalGrade() {
		return healthSurveyTotalGrade;
	}
	public void setHealthSurveyTotalGrade(int healthSurveyTotalGrade) {
		this.healthSurveyTotalGrade = healthSurveyTotalGrade;
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
	public int getHealthSurveyRegisterNormal() {
		return healthSurveyRegisterNormal;
	}
	public void setHealthSurveyRegisterNormal(int healthSurveyRegisterNormal) {
		this.healthSurveyRegisterNormal = healthSurveyRegisterNormal;
	}
	public int getHealthSurveyRegisterWarning() {
		return healthSurveyRegisterWarning;
	}
	public void setHealthSurveyRegisterWarning(int healthSurveyRegisterWarning) {
		this.healthSurveyRegisterWarning = healthSurveyRegisterWarning;
	}
	public int getHealthSurveyRegisterDanger() {
		return healthSurveyRegisterDanger;
	}
	public void setHealthSurveyRegisterDanger(int healthSurveyRegisterDanger) {
		this.healthSurveyRegisterDanger = healthSurveyRegisterDanger;
	}
	public int getHealthSurveyRegisterTotal() {
		return healthSurveyRegisterTotal;
	}
	public void setHealthSurveyRegisterTotal(int healthSurveyRegisterTotal) {
		this.healthSurveyRegisterTotal = healthSurveyRegisterTotal;
	}
	public int getHealthSurveyRegisterDate() {
		return healthSurveyRegisterDate;
	}
	public void setHealthSurveyRegisterDate(int healthSurveyRegisterDate) {
		this.healthSurveyRegisterDate = healthSurveyRegisterDate;
	}
	@Override
	public String toString() {
		return "HealthSurveyResultResponse [healthSurveyResultNo=" + healthSurveyResultNo + ", healthSurveyRegisterNo="
				+ healthSurveyRegisterNo + ", healthSurveyResultDate=" + healthSurveyResultDate
				+ ", healthSurveyTotalGrade=" + healthSurveyTotalGrade + ", memberName=" + memberName + ", diseaseName="
				+ diseaseName + ", healthSurveyRegisterTitle=" + healthSurveyRegisterTitle
				+ ", healthSurveyRegisterContent=" + healthSurveyRegisterContent + ", healthSurveyRegisterNormal="
				+ healthSurveyRegisterNormal + ", healthSurveyRegisterWarning=" + healthSurveyRegisterWarning
				+ ", healthSurveyRegisterDanger=" + healthSurveyRegisterDanger + ", healthSurveyRegisterTotal="
				+ healthSurveyRegisterTotal + ", healthSurveyRegisterDate=" + healthSurveyRegisterDate + "]";
	}
	
}
