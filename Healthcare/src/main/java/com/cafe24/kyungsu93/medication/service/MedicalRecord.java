package com.cafe24.kyungsu93.medication.service;

public class MedicalRecord {
	private String medicalNo;
	private String medicalRecordDate;
	
	public String getMedicalNo() {
		return medicalNo;
	}
	public void setMedicalNo(String medicalNo) {
		this.medicalNo = medicalNo;
	}
	public String getMedicalRecordDate() {
		return medicalRecordDate;
	}
	public void setMedicalRecordDate(String medicalRecordDate) {
		this.medicalRecordDate = medicalRecordDate;
	}
	@Override
	public String toString() {
		return "MedicalRecord [medicalNo=" + medicalNo + ", medicalRecordDate=" + medicalRecordDate + "]";
	}
	
}
