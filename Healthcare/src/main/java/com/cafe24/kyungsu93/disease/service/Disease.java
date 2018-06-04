package com.cafe24.kyungsu93.disease.service;

public class Disease {
	private String diseaseNo;
	private String diseaseName;
	private String diseaseDate;
	public String getDiseaseNo() {
		return diseaseNo;
	}
	public void setDiseaseNo(String diseaseNo) {
		this.diseaseNo = diseaseNo;
	}
	public String getDiseaseName() {
		return diseaseName;
	}
	public void setDiseaseName(String diseaseName) {
		this.diseaseName = diseaseName;
	}
	public String getDiseaseDate() {
		return diseaseDate;
	}
	public void setDiseaseDate(String diseaseDate) {
		this.diseaseDate = diseaseDate;
	}
	@Override
	public String toString() {
		return "Disease [diseaseNo=" + diseaseNo + ", diseaseName=" + diseaseName + ", diseaseDate=" + diseaseDate
				+ "]";
	}
	
	
}
