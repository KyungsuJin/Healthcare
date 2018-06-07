package com.cafe24.kyungsu93.disease.service;

public class MyDiseaseDetail {
	private String diseaseSubCategoryNo;
	private String myDiseaseNo;
	private String myDiseaseDateilDate;
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
	@Override
	public String toString() {
		return "MyDiseaseDetail [diseaseSubCategoryNo=" + diseaseSubCategoryNo + ", myDiseaseNo=" + myDiseaseNo
				+ ", myDiseaseDateilDate=" + myDiseaseDateilDate + "]";
	}
	
	
}
