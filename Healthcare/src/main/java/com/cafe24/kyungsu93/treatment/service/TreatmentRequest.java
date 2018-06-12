package com.cafe24.kyungsu93.treatment.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class TreatmentRequest {
	private String treatmentNo;
	private String memberNo;
	private String treatmentDepartment;
	private String hospitalName;
	private String treatmentTitle;
	private String treatmentContent;
	private String doctorName;
	private String hospitalAddress;
	private List<String> treatmentDeleteList;
	private List<MultipartFile> multipartFile;
	
	public String getTreatmentNo() {
		return treatmentNo;
	}
	public void setTreatmentNo(String treatmentNo) {
		this.treatmentNo = treatmentNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getTreatmentDepartment() {
		return treatmentDepartment;
	}
	public void setTreatmentDepartment(String treatmentDepartment) {
		this.treatmentDepartment = treatmentDepartment;
	}
	public String getHospitalName() {
		return hospitalName;
	}
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	public String getTreatmentTitle() {
		return treatmentTitle;
	}
	public void setTreatmentTitle(String treatmentTitle) {
		this.treatmentTitle = treatmentTitle;
	}
	public String getTreatmentContent() {
		return treatmentContent;
	}
	public void setTreatmentContent(String treatmentContent) {
		this.treatmentContent = treatmentContent;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public String getHospitalAddress() {
		return hospitalAddress;
	}
	public void setHospitalAddress(String hospitalAddress) {
		this.hospitalAddress = hospitalAddress;
	}
	public List<String> getTreatmentDeleteList() {
		return treatmentDeleteList;
	}
	public void setTreatmentDeleteList(List<String> treatmentDeleteList) {
		this.treatmentDeleteList = treatmentDeleteList;
	}
	public List<MultipartFile> getMultipartFile() {
		return multipartFile;
	}
	public void setMultipartFile(List<MultipartFile> multipartFile) {
		this.multipartFile = multipartFile;
	}
	@Override
	public String toString() {
		return "TreatmentRequest [treatmentNo=" + treatmentNo + ", memberNo=" + memberNo + ", treatmentDepartment="
				+ treatmentDepartment + ", hospitalName=" + hospitalName + ", treatmentTitle=" + treatmentTitle
				+ ", treatmentContent=" + treatmentContent + ", doctorName=" + doctorName + ", hospitalAddress="
				+ hospitalAddress + ", treatmentDeleteList=" + treatmentDeleteList + ", multipartFile=" + multipartFile
				+ "]";
	}
}
