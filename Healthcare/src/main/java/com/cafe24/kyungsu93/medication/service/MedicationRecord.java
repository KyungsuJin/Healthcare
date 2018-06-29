package com.cafe24.kyungsu93.medication.service;

public class MedicationRecord {
	private String medicationRecordNo;
	private String medicationNo;
	private String medicationRecordDate;
	
	public String getMedicationRecordNo() {
		return medicationRecordNo;
	}
	public void setMedicationRecordNo(String medicationRecordNo) {
		this.medicationRecordNo = medicationRecordNo;
	}
	public String getMedicationNo() {
		return medicationNo;
	}
	public void setMedicationNo(String medicationNo) {
		this.medicationNo = medicationNo;
	}
	public String getMedicationRecordDate() {
		return medicationRecordDate;
	}
	public void setMedicationRecordDate(String medicationRecordDate) {
		this.medicationRecordDate = medicationRecordDate;
	}
	@Override
	public String toString() {
		return "MedicationRecord [medicationRecordNo=" + medicationRecordNo + ", medicationNo=" + medicationNo
				+ ", medicationRecordDate=" + medicationRecordDate + "]";
	}
}
