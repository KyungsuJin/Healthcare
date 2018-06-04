package com.cafe24.kyungsu93.disease.service;

public class DiseaseSubCategory {
	private String diseaseSubCategoryNo;
	private String diseaseNo;
	private String familyHistory;
	private String diseaseSubCategoryName;
	private String diseaseSubCategoryDate;
	public String getDiseaseSubCategoryNo() {
		return diseaseSubCategoryNo;
	}
	public void setDiseaseSubCategoryNo(String diseaseSubCategoryNo) {
		this.diseaseSubCategoryNo = diseaseSubCategoryNo;
	}
	public String getDiseaseNo() {
		return diseaseNo;
	}
	public void setDiseaseNo(String diseaseNo) {
		this.diseaseNo = diseaseNo;
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
	public String getDiseaseSubCategoryDate() {
		return diseaseSubCategoryDate;
	}
	public void setDiseaseSubCategoryDate(String diseaseSubCategoryDate) {
		this.diseaseSubCategoryDate = diseaseSubCategoryDate;
	}
	@Override
	public String toString() {
		return "DiseaseSubCategory [diseaseSubCategoryNo=" + diseaseSubCategoryNo + ", diseaseNo=" + diseaseNo
				+ ", familyHistory=" + familyHistory + ", diseaseSubCategoryName=" + diseaseSubCategoryName
				+ ", diseaseSubCategoryDate=" + diseaseSubCategoryDate + "]";
	}
	
	
}
