package com.cafe24.kyungsu93.healthsurvey.service;

import java.util.Arrays;

public class HealthSurveySelection {
	private String healthSurveySelectionNo;
	private String healthSurveyQuestionNo;
	private int[] selectionNoList;
	private int selectionNo;
	private String[] healthSurveySelectionList;
	private String healthSurveySelection;
	private int[] healthSurveySelectionScoreList;
	private int healthSurveySelectionScore;
	
	public String getHealthSurveySelectionNo() {
		return healthSurveySelectionNo;
	}
	public void setHealthSurveySelectionNo(String healthSurveySelectionNo) {
		this.healthSurveySelectionNo = healthSurveySelectionNo;
	}
	public String getHealthSurveyQuestionNo() {
		return healthSurveyQuestionNo;
	}
	public void setHealthSurveyQuestionNo(String healthSurveyQuestionNo) {
		this.healthSurveyQuestionNo = healthSurveyQuestionNo;
	}
	public int[] getSelectionNoList() {
		return selectionNoList;
	}
	public void setSelectionNoList(int[] selectionNoList) {
		this.selectionNoList = selectionNoList;
	}
	public int getSelectionNo() {
		return selectionNo;
	}
	public void setSelectionNo(int selectionNo) {
		this.selectionNo = selectionNo;
	}
	public String[] getHealthSurveySelectionList() {
		return healthSurveySelectionList;
	}
	public void setHealthSurveySelectionList(String[] healthSurveySelectionList) {
		this.healthSurveySelectionList = healthSurveySelectionList;
	}
	public String getHealthSurveySelection() {
		return healthSurveySelection;
	}
	public void setHealthSurveySelection(String healthSurveySelection) {
		this.healthSurveySelection = healthSurveySelection;
	}
	public int[] getHealthSurveySelectionScoreList() {
		return healthSurveySelectionScoreList;
	}
	public void setHealthSurveySelectionScoreList(int[] healthSurveySelectionScoreList) {
		this.healthSurveySelectionScoreList = healthSurveySelectionScoreList;
	}
	public int getHealthSurveySelectionScore() {
		return healthSurveySelectionScore;
	}
	public void setHealthSurveySelectionScore(int healthSurveySelectionScore) {
		this.healthSurveySelectionScore = healthSurveySelectionScore;
	}
	@Override
	public String toString() {
		return "HealthSurveySelection [healthSurveySelectionNo=" + healthSurveySelectionNo + ", healthSurveyQuestionNo="
				+ healthSurveyQuestionNo + ", selectionNoList=" + Arrays.toString(selectionNoList) + ", selectionNo="
				+ selectionNo + ", healthSurveySelectionList=" + Arrays.toString(healthSurveySelectionList)
				+ ", healthSurveySelection=" + healthSurveySelection + ", healthSurveySelectionScoreList="
				+ Arrays.toString(healthSurveySelectionScoreList) + ", healthSurveySelectionScore="
				+ healthSurveySelectionScore + "]";
	}
	
}
