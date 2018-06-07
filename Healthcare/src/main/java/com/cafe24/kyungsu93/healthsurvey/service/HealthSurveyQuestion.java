package com.cafe24.kyungsu93.healthsurvey.service;

import java.util.Arrays;
import java.util.List;

public class HealthSurveyQuestion {
	private String healthSurveyQuestionNo;
	private String healthSurveyRegisterNo;
	private int[] questionNoList;
	private int questionNo;
	private String[] healthSurveyQuestionList;
	private String healthSurveyQuestion;
	private List<HealthSurveySelection> healthSurveySelection;
	
	public String getHealthSurveyQuestionNo() {
		return healthSurveyQuestionNo;
	}
	public void setHealthSurveyQuestionNo(String healthSurveyQuestionNo) {
		this.healthSurveyQuestionNo = healthSurveyQuestionNo;
	}
	public String getHealthSurveyRegisterNo() {
		return healthSurveyRegisterNo;
	}
	public void setHealthSurveyRegisterNo(String healthSurveyRegisterNo) {
		this.healthSurveyRegisterNo = healthSurveyRegisterNo;
	}
	public int[] getQuestionNoList() {
		return questionNoList;
	}
	public void setQuestionNoList(int[] questionNoList) {
		this.questionNoList = questionNoList;
	}
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public String[] getHealthSurveyQuestionList() {
		return healthSurveyQuestionList;
	}
	public void setHealthSurveyQuestionList(String[] healthSurveyQuestionList) {
		this.healthSurveyQuestionList = healthSurveyQuestionList;
	}
	public String getHealthSurveyQuestion() {
		return healthSurveyQuestion;
	}
	public void setHealthSurveyQuestion(String healthSurveyQuestion) {
		this.healthSurveyQuestion = healthSurveyQuestion;
	}
	public List<HealthSurveySelection> getHealthSurveySelection() {
		return healthSurveySelection;
	}
	public void setHealthSurveySelection(List<HealthSurveySelection> healthSurveySelection) {
		this.healthSurveySelection = healthSurveySelection;
	}
	@Override
	public String toString() {
		return "HealthSurveyQuestion [healthSurveyQuestionNo=" + healthSurveyQuestionNo + ", healthSurveyRegisterNo="
				+ healthSurveyRegisterNo + ", questionNoList=" + Arrays.toString(questionNoList) + ", questionNo="
				+ questionNo + ", healthSurveyQuestionList=" + Arrays.toString(healthSurveyQuestionList)
				+ ", healthSurveyQuestion=" + healthSurveyQuestion + ", healthSurveySelection=" + healthSurveySelection
				+ "]";
	}
	
}
