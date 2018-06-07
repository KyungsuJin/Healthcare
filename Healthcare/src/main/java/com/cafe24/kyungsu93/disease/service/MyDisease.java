package com.cafe24.kyungsu93.disease.service;

public class MyDisease {
	private String myDiseaseNo;
	private String memberNo;
	public String getMyDiseaseNo() {
		return myDiseaseNo;
	}
	public void setMyDiseaseNo(String myDiseaseNo) {
		this.myDiseaseNo = myDiseaseNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "MyDisease [myDiseaseNo=" + myDiseaseNo + ", memberNo=" + memberNo + "]";
	}
	
}
