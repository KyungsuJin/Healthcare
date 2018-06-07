package com.cafe24.kyungsu93.disease.service;

public class MyDiseaseDetail {
	private String myDiseaseDetailNo;
	private String diseaseSubCategoryNo;
	private String myDiseaseNo;
	private String myDiseaseDateilDate;
	private String familyHistory;
	private String diseaseSubCategoryName;
	private String diseaseName;
	

	public String getMyDiseaseDetailNo() {
		return myDiseaseDetailNo;
	}
	public void setMyDiseaseDetailNo(String myDiseaseDetailNo) {
		this.myDiseaseDetailNo = myDiseaseDetailNo;
	}
	public String getDiseaseSubCategoryNo() {
		return diseaseSubCategoryNo;
	}
	public void setDiseaseSubCategoryNo(String diseaseSubCategoryNo) {
		this.diseaseSubCategoryNo = diseaseSubCategoryNo;
	}
	public String getMyDiseaseNo() {
		return myDiseaseNo;
	}
	public void setMyDiseaseNo(String myDiseaseNo) {
		this.myDiseaseNo = myDiseaseNo;
	}
	public String getMyDiseaseDateilDate() {
		return myDiseaseDateilDate;
	}
	public void setMyDiseaseDateilDate(String myDiseaseDateilDate) {
		this.myDiseaseDateilDate = myDiseaseDateilDate;
	}
	public String getFamilyHistory() {
		return familyHistory;
	}
	public void setFamilyHistory(String familyHistory) {
		this.familyHistory = familyHistory;
	}
	public String getDiseaseSubCategoryName() {
		return diseaseSubCategoryName;
	}
	public void setDiseaseSubCategoryName(String diseaseSubCategoryName) {
		this.diseaseSubCategoryName = diseaseSubCategoryName;
	}
	public String getDiseaseName() {
		return diseaseName;
	}
	public void setDiseaseName(String diseaseName) {
		this.diseaseName = diseaseName;
	}
	@Override
	public String toString() {
		return "MyDiseaseDetail [myDiseaseDetailNo=" + myDiseaseDetailNo + ", diseaseSubCategoryNo="
				+ diseaseSubCategoryNo + ", myDiseaseNo=" + myDiseaseNo + ", myDiseaseDateilDate=" + myDiseaseDateilDate
				+ ", familyHistory=" + familyHistory + ", diseaseSubCategoryName=" + diseaseSubCategoryName
				+ ", diseaseName=" + diseaseName + "]";
	}

	
}
