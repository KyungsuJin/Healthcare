package com.cafe24.kyungsu93.medication.service;

public class MedicationRequest {
	private String medicationNo;
	private String medicineNo;
	private String memberNo;
	private String medicationStartDate;
	private String medicationEndDate;
	private int dosage;
	private int totalDosage;
	private String medicationTitle;
	private String medicationContent;
	private String medicationDate;
	
	public String getMedicationNo() {
		return medicationNo;
	}
	public void setMedicationNo(String medicationNo) {
		this.medicationNo = medicationNo;
	}
	public String getMedicineNo() {
		return medicineNo;
	}
	public void setMedicineNo(String medicineNo) {
		this.medicineNo = medicineNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMedicationStartDate() {
		return medicationStartDate;
	}
	public void setMedicationStartDate(String medicationStartDate) {
		this.medicationStartDate = medicationStartDate;
	}
	public String getMedicationEndDate() {
		return medicationEndDate;
	}
	public void setMedicationEndDate(String medicationEndDate) {
		this.medicationEndDate = medicationEndDate;
	}
	public int getDosage() {
		return dosage;
	}
	public void setDosage(int dosage) {
		this.dosage = dosage;
	}
	public int getTotalDosage() {
		return totalDosage;
	}
	public void setTotalDosage(int totalDosage) {
		this.totalDosage = totalDosage;
	}
	public String getMedicationTitle() {
		return medicationTitle;
	}
	public void setMedicationTitle(String medicationTitle) {
		this.medicationTitle = medicationTitle;
	}
	public String getMedicationContent() {
		return medicationContent;
	}
	public void setMedicationContent(String medicationContent) {
		this.medicationContent = medicationContent;
	}
	public String getMedicationDate() {
		return medicationDate;
	}
	public void setMedicationDate(String medicationDate) {
		this.medicationDate = medicationDate;
	}
	@Override
	public String toString() {
		return "MedicationRequest [medicationNo=" + medicationNo + ", medicineNo=" + medicineNo + ", memberNo="
				+ memberNo + ", medicationStartDate=" + medicationStartDate + ", medicationEndDate=" + medicationEndDate
				+ ", dosage=" + dosage + ", totalDosage=" + totalDosage + ", medicationTitle=" + medicationTitle
				+ ", medicationContent=" + medicationContent + ", medicationDate=" + medicationDate + "]";
	}
}
