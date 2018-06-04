package com.cafe24.kyungsu93.member.service;

import org.springframework.web.multipart.MultipartFile;

public class Member {
	private String memberNo;
	private String memberId;
	private String memberPw;
	private int memberLevel;
	private String memberName;
	private String memberGender;
	private String memberAddress;
	private String memberEmail;
	private String memberBirth;
	private String memberTel;
	private int memberPoint;
	private String memberAgree;
	private String doctorRegisterNo;
	private String hospitalName;
	private String treatmentDepartment;
	private String memberWorkSpace;
	private String teacherRegisterNo;
	private MultipartFile teacherMultipartFile;
	private MultipartFile multipartFile;
	private MemberFile memberFile;
	private String memberJoinDate;
	
	

	public String getMemberJoinDate() {
		return memberJoinDate;
	}

	public void setMemberJoinDate(String memberJoinDate) {
		this.memberJoinDate = memberJoinDate;
	}

	public MemberFile getMemberFile() {
		return memberFile;
	}

	public void setMemberFile(MemberFile memberFile) {
		this.memberFile = memberFile;
	}

	public MultipartFile getTeacherMultipartFile() {
		return teacherMultipartFile;
	}

	public void setTeacherMultipartFile(MultipartFile teacherMultipartFile) {
		this.teacherMultipartFile = teacherMultipartFile;
	}

	public String getMemberWorkSpace() {
		return memberWorkSpace;
	}

	public void setMemberWorkSpace(String memberWorkSpace) {
		this.memberWorkSpace = memberWorkSpace;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public int getMemberLevel() {
		return memberLevel;
	}

	public void setMemberLevel(int memberLevel) {
		this.memberLevel = memberLevel;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberGender() {
		return memberGender;
	}

	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberBirth() {
		return memberBirth;
	}

	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}

	public String getMemberTel() {
		return memberTel;
	}

	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}

	public int getMemberPoint() {
		return memberPoint;
	}

	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}

	public String getMemberAgree() {
		return memberAgree;
	}

	public void setMemberAgree(String memberAgree) {
		this.memberAgree = memberAgree;
	}
	public String getHospitalName() {
		return hospitalName;
	}

	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}
	
	public String getTreatmentDepartment() {
		return treatmentDepartment;
	}

	public void setTreatmentDepartment(String treatmentDepartment) {
		this.treatmentDepartment = treatmentDepartment;
	}
	public String getDoctorRegisterNo() {
		return doctorRegisterNo;
	}
	public void setDoctorRegisterNo(String doctorRegisterNo) {
		this.doctorRegisterNo = doctorRegisterNo;
	}

	public String getTeacherRegisterNo() {
		return teacherRegisterNo;
	}

	public void setTeacherRegisterNo(String teacherRegisterNo) {
		this.teacherRegisterNo = teacherRegisterNo;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPw=" + memberPw + ", memberLevel="
				+ memberLevel + ", memberName=" + memberName + ", memberGender=" + memberGender + ", memberAddress="
				+ memberAddress + ", memberEmail=" + memberEmail + ", memberBirth=" + memberBirth + ", memberTel="
				+ memberTel + ", memberPoint=" + memberPoint + ", memberAgree=" + memberAgree + ", doctorRegisterNo="
				+ doctorRegisterNo + ", hospitalName=" + hospitalName + ", treatmentDepartment=" + treatmentDepartment
				+ ", memberWorkSpace=" + memberWorkSpace + ", teacherRegisterNo=" + teacherRegisterNo
				+ ", multipartFile=" + multipartFile + "]";
	}
	
	
	
	
}