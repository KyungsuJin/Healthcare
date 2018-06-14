package com.cafe24.kyungsu93.medicine.service;

public class Medicine {
	private String medicineNo;
	private String medicineName;
	private String medicineManufacturer;
	private String medicineMaterial;
	private String medicineStorageMethod;
	private String medicineValidTerm;
	private String medicineEtcOtc;
	private String medicineClass;
	private String medicineAppear;
	private String medicinePack;
	private int medicinePermissionDate;
	
	public String getMedicineNo() {
		return medicineNo;
	}
	public void setMedicineNo(String medicineNo) {
		this.medicineNo = medicineNo;
	}
	public String getMedicineName() {
		return medicineName;
	}
	public void setMedicineName(String medicineName) {
		this.medicineName = medicineName;
	}
	public String getMedicineManufacturer() {
		return medicineManufacturer;
	}
	public void setMedicineManufacturer(String medicineManufacturer) {
		this.medicineManufacturer = medicineManufacturer;
	}
	public String getMedicineMaterial() {
		return medicineMaterial;
	}
	public void setMedicineMaterial(String medicineMaterial) {
		this.medicineMaterial = medicineMaterial;
	}
	public String getMedicineStorageMethod() {
		return medicineStorageMethod;
	}
	public void setMedicineStorageMethod(String medicineStorageMethod) {
		this.medicineStorageMethod = medicineStorageMethod;
	}
	public String getMedicineValidTerm() {
		return medicineValidTerm;
	}
	public void setMedicineValidTerm(String medicineValidTerm) {
		this.medicineValidTerm = medicineValidTerm;
	}
	public String getMedicineEtcOtc() {
		return medicineEtcOtc;
	}
	public void setMedicineEtcOtc(String medicineEtcOtc) {
		this.medicineEtcOtc = medicineEtcOtc;
	}
	public String getMedicineClass() {
		return medicineClass;
	}
	public void setMedicineClass(String medicineClass) {
		this.medicineClass = medicineClass;
	}
	public String getMedicineAppear() {
		return medicineAppear;
	}
	public void setMedicineAppear(String medicineAppear) {
		this.medicineAppear = medicineAppear;
	}
	public String getMedicinePack() {
		return medicinePack;
	}
	public void setMedicinePack(String medicinePack) {
		this.medicinePack = medicinePack;
	}
	public int getMedicinePermissionDate() {
		return medicinePermissionDate;
	}
	public void setMedicinePermissionDate(int medicinePermissionDate) {
		this.medicinePermissionDate = medicinePermissionDate;
	}
	@Override
	public String toString() {
		return "Medicine [medicineNo=" + medicineNo + ", medicineName=" + medicineName + ", medicineManufacturer="
				+ medicineManufacturer + ", medicineMaterial=" + medicineMaterial + ", medicineStorageMethod="
				+ medicineStorageMethod + ", medicineValidTerm=" + medicineValidTerm + ", medicineEtcOtc="
				+ medicineEtcOtc + ", medicineClass=" + medicineClass + ", medicineAppear=" + medicineAppear
				+ ", medicinePack=" + medicinePack + ", medicinePermissionDate=" + medicinePermissionDate + "]";
	}
	
}
