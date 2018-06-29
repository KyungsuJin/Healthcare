package com.cafe24.kyungsu93.medical.service;

public class Medical {
	private String medicalNo;
	private String medicalType;
	private String medicalName;
	private String cityName;
	private String districtName;
	private String medicalAddress;
	private String medicalTel;
	
	public String getMedicalNo() {
		return medicalNo;
	}
	public void setMedicalNo(String medicalNo) {
		this.medicalNo = medicalNo;
	}
	public String getMedicalType() {
		return medicalType;
	}
	public void setMedicalType(String medicalType) {
		this.medicalType = medicalType;
	}
	public String getMedicalName() {
		return medicalName;
	}
	public void setMedicalName(String medicalName) {
		this.medicalName = medicalName;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getDistrictName() {
		return districtName;
	}
	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}
	public String getMedicalAddress() {
		return medicalAddress;
	}
	public void setMedicalAddress(String medicalAddress) {
		this.medicalAddress = medicalAddress;
	}
	public String getMedicalTel() {
		return medicalTel;
	}
	public void setMedicalTel(String medicalTel) {
		this.medicalTel = medicalTel;
	}
	@Override
	public String toString() {
		return "Medical [medicalNo=" + medicalNo + ", medicalType=" + medicalType + ", medicalName=" + medicalName
				+ ", cityName=" + cityName + ", districtName=" + districtName + ", medicalAddress=" + medicalAddress
				+ ", medicalTel=" + medicalTel + "]";
	}
	
}
