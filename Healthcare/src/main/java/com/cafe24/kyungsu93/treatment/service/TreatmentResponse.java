package com.cafe24.kyungsu93.treatment.service;

import java.util.List;

public class TreatmentResponse {
	private String treatmentNo;
	private String memberNo;
	private String treatmentDepartment;
	private String hospitalName;
	private String treatmentTitle;
	private String treatmentContent;
	private String doctorName;
	private String hospitalAddress;
	private String treatmentDate;
	private List<TreatmentFile> treatmentFile;
	
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
	public String getTreatmentDate() {
		return treatmentDate;
	}
	public void setTreatmentDate(String treatmentDate) {
		this.treatmentDate = treatmentDate;
	}
	public List<TreatmentFile> getTreatmentFile() {
		return treatmentFile;
	}
	public void setTreatmentFile(List<TreatmentFile> treatmentFile) {
		this.treatmentFile = treatmentFile;
	}
	@Override
	public String toString() {
		return "TreatmentResponse [treatmentNo=" + treatmentNo + ", memberNo=" + memberNo + ", treatmentDepartment="
				+ treatmentDepartment + ", hospitalName=" + hospitalName + ", treatmentTitle=" + treatmentTitle
				+ ", treatmentContent=" + treatmentContent + ", doctorName=" + doctorName + ", hospitalAddress="
				+ hospitalAddress + ", treatmentDate=" + treatmentDate + ", treatmentFile=" + treatmentFile + "]";
	}
}
