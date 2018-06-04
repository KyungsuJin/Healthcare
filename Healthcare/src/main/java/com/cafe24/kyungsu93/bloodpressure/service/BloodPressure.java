package com.cafe24.kyungsu93.bloodpressure.service;

public class BloodPressure {
	private String bloodPressureNo;
	private String memberNo;
	private int systolicBloodPressure;
	private int relaxerBloodPressure;
	private String bloodPressureDate;
	private String memberId;
	private String memberName;
	public String getBloodPressureNo() {
		return bloodPressureNo;
	}
	public void setBloodPressureNo(String bloodPressureNo) {
		this.bloodPressureNo = bloodPressureNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public int getSystolicBloodPressure() {
		return systolicBloodPressure;
	}
	public void setSystolicBloodPressure(int systolicBloodPressure) {
		this.systolicBloodPressure = systolicBloodPressure;
	}
	public int getRelaxerBloodPressure() {
		return relaxerBloodPressure;
	}
	public void setRelaxerBloodPressure(int relaxerBloodPressure) {
		this.relaxerBloodPressure = relaxerBloodPressure;
	}
	public String getBloodPressureDate() {
		return bloodPressureDate;
	}
	public void setBloodPressureDate(String bloodPressureDate) {
		this.bloodPressureDate = bloodPressureDate;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	@Override
	public String toString() {
		return "BloodPressure [bloodPressureNo=" + bloodPressureNo + ", memberNo=" + memberNo
				+ ", systolicBloodPressure=" + systolicBloodPressure + ", relaxerBloodPressure=" + relaxerBloodPressure
				+ ", bloodPressureDate=" + bloodPressureDate + ", memberId=" + memberId + ", memberName=" + memberName
				+ "]";
	}
}