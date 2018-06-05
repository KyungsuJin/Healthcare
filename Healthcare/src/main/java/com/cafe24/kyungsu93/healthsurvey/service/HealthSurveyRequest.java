package com.cafe24.kyungsu93.healthsurvey.service;

public class HealthSurveyRequest {
	private String healthSurveyRegisterNo;
	private String memberNo;
	private String diseaseNo;
	private String healthSurveyRegisterTitle;
	private String healthSurveyRegisterContent;
	private int healthSurveyPoint;
	private int healthSurveyRegisterNormal;
	private int healthSurveyRegisterWarning;
	private int healthSurveyRegisterDanger;
	private int healthSurveyRegisterCount;
	private int healthSurveyRegisterTotal;
	private String healthSurveyRegisterDate;
	
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
	public String getDiseaseNo() {
		return diseaseNo;
	}
	public void setDiseaseNo(String diseaseNo) {
		this.diseaseNo = diseaseNo;
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
	public int getHealthSurveyRegisterCount() {
		return healthSurveyRegisterCount;
	}
	public void setHealthSurveyRegisterCount(int healthSurveyRegisterCount) {
		this.healthSurveyRegisterCount = healthSurveyRegisterCount;
	}
	public int getHealthSurveyRegisterTotal() {
		return healthSurveyRegisterTotal;
	}
	public void setHealthSurveyRegisterTotal(int healthSurveyRegisterTotal) {
		this.healthSurveyRegisterTotal = healthSurveyRegisterTotal;
	}
	public String getHealthSurveyRegisterDate() {
		return healthSurveyRegisterDate;
	}
	public void setHealthSurveyRegisterDate(String healthSurveyRegisterDate) {
		this.healthSurveyRegisterDate = healthSurveyRegisterDate;
	}
	@Override
	public String toString() {
		return "HealthSurveyRequest [healthSurveyRegisterNo=" + healthSurveyRegisterNo + ", memberNo=" + memberNo
				+ ", diseaseNo=" + diseaseNo + ", healthSurveyRegisterTitle=" + healthSurveyRegisterTitle
				+ ", healthSurveyRegisterContent=" + healthSurveyRegisterContent + ", healthSurveyPoint="
				+ healthSurveyPoint + ", healthSurveyRegisterNormal=" + healthSurveyRegisterNormal
				+ ", healthSurveyRegisterWarning=" + healthSurveyRegisterWarning + ", healthSurveyRegisterDanger="
				+ healthSurveyRegisterDanger + ", healthSurveyRegisterCount=" + healthSurveyRegisterCount
				+ ", healthSurveyRegisterTotal=" + healthSurveyRegisterTotal + ", healthSurveyRegisterDate="
				+ healthSurveyRegisterDate + "]";
	}
	
}
