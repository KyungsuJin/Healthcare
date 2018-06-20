package com.cafe24.kyungsu93.bloodsugar.service;

public class BloodSugar {

	private String bloodSugarNo;
	private String memberNo;
	private int fastingBloodSugar;
	private String fastingState;
	private String bloodSugarDate;
	public String getBloodSugarNo() {
		return bloodSugarNo;
	}
	public void setBloodSugarNo(String bloodSugarNo) {
		this.bloodSugarNo = bloodSugarNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public int getFastingBloodSugar() {
		return fastingBloodSugar;
	}
	public void setFastingBloodSugar(int fastingBloodSugar) {
		this.fastingBloodSugar = fastingBloodSugar;
	}
	public String getFastingState() {
		return fastingState;
	}
	public void setFastingState(String fastingState) {
		this.fastingState = fastingState;
	}
	public String getBloodSugarDate() {
		return bloodSugarDate;
	}
	public void setBloodSugarDate(String bloodSugarDate) {
		this.bloodSugarDate = bloodSugarDate;
	}
	@Override
	public String toString() {
		return "Bloodsugar [bloodSugarNo=" + bloodSugarNo + ", memberNo=" + memberNo + ", fastingBloodSugar="
				+ fastingBloodSugar + ", fastingState=" + fastingState + ", bloodSugarDate=" + bloodSugarDate + "]";
	}
}