package com.cafe24.kyungsu93.healthscreen.service;

public class HealthScreen {
	private String healthScreenNo;
	private String memberNo;
	private String bloodSugarNo;
	private String bloodPressureNo;
	private String bodyMassIndexNo;
	private int totalCholesterol;
	private int ldlCholesterol;
	private int neutralFat;
	private int hdlCholesterol;
	private String proteinuria;
	private double hemoglobin;
	private double serumCreatinine;
	private int gfr;
	private String healthScreenDate;
	
	public String getHealthScreenNo() {
		return healthScreenNo;
	}
	public void setHealthScreenNo(String healthScreenNo) {
		this.healthScreenNo = healthScreenNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getBloodSugarNo() {
		return bloodSugarNo;
	}
	public void setBloodSugarNo(String bloodSugarNo) {
		this.bloodSugarNo = bloodSugarNo;
	}
	public String getBloodPressureNo() {
		return bloodPressureNo;
	}
	public void setBloodPressureNo(String bloodPressureNo) {
		this.bloodPressureNo = bloodPressureNo;
	}
	public String getBodyMassIndexNo() {
		return bodyMassIndexNo;
	}
	public void setBodyMassIndexNo(String bodyMassIndexNo) {
		this.bodyMassIndexNo = bodyMassIndexNo;
	}
	public int getTotalCholesterol() {
		return totalCholesterol;
	}
	public void setTotalCholesterol(int totalCholesterol) {
		this.totalCholesterol = totalCholesterol;
	}
	public int getLdlCholesterol() {
		return ldlCholesterol;
	}
	public void setLdlCholesterol(int ldlCholesterol) {
		this.ldlCholesterol = ldlCholesterol;
	}
	public int getNeutralFat() {
		return neutralFat;
	}
	public void setNeutralFat(int neutralFat) {
		this.neutralFat = neutralFat;
	}
	public int getHdlCholesterol() {
		return hdlCholesterol;
	}
	public void setHdlCholesterol(int hdlCholesterol) {
		this.hdlCholesterol = hdlCholesterol;
	}
	public String getProteinuria() {
		return proteinuria;
	}
	public void setProteinuria(String proteinuria) {
		this.proteinuria = proteinuria;
	}
	public double getHemoglobin() {
		return hemoglobin;
	}
	public void setHemoglobin(double hemoglobin) {
		this.hemoglobin = hemoglobin;
	}
	public double getSerumCreatinine() {
		return serumCreatinine;
	}
	public void setSerumCreatinine(double serumCreatinine) {
		this.serumCreatinine = serumCreatinine;
	}
	public int getGfr() {
		return gfr;
	}
	public void setGfr(int gfr) {
		this.gfr = gfr;
	}
	public String getHealthScreenDate() {
		return healthScreenDate;
	}
	public void setHealthScreenDate(String healthScreenDate) {
		this.healthScreenDate = healthScreenDate;
	}
	@Override
	public String toString() {
		return "HealthScreen [healthScreenNo=" + healthScreenNo + ", memberNo=" + memberNo + ", bloodSugarNo="
				+ bloodSugarNo + ", bloodPressureNo=" + bloodPressureNo + ", bodyMassIndexNo=" + bodyMassIndexNo
				+ ", totalCholesterol=" + totalCholesterol + ", ldlCholesterol=" + ldlCholesterol + ", neutralFat="
				+ neutralFat + ", hdlCholesterol=" + hdlCholesterol + ", proteinuria=" + proteinuria + ", hemoglobin="
				+ hemoglobin + ", serumCreatinine=" + serumCreatinine + ", gfr=" + gfr + ", healthScreenDate="
				+ healthScreenDate + "]";
	}
	
}
