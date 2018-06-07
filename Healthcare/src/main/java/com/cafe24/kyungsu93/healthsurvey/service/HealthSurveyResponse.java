package com.cafe24.kyungsu93.healthsurvey.service;

public class HealthSurveyResponse {
	private String healthSurveyRegisterNo; //설문 등록 번호
	private String memberName; //설문 올린 의사 이름
	private String diseaseName; //질병 이름
	private double surveyGrade; //설문 평균 평가 점수
	private String healthSurveyRegisterTitle; //설문 이름
	private String healthSurveyRegisterContent; //설문 을 통해서 얻고자하는 것 내용
	private int healthSurveyPoint; //설문 차감 포인트
	private int healthSurveyRegisterCount; //총 설문한사람 숫자
	private String healthSurveyRegisterDate; //설문 등록 날짜
	
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
				+ ", diseaseName=" + diseaseName + ", surveyGrade=" + surveyGrade + ", healthSurveyRegisterTitle="
				+ healthSurveyRegisterTitle + ", healthSurveyRegisterContent=" + healthSurveyRegisterContent
				+ ", healthSurveyPoint=" + healthSurveyPoint + ", healthSurveyRegisterCount="
				+ healthSurveyRegisterCount + ", healthSurveyRegisterDate=" + healthSurveyRegisterDate + "]";
	}
	
}
