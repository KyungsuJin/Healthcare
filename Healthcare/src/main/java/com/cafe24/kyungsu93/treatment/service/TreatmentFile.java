package com.cafe24.kyungsu93.treatment.service;

public class TreatmentFile {
	private String treatmentFileNo;
	private String treatmentNo;
	private String treatmentFileExt;
	private long treatmentFileSize;
	private String treatmentFileType;
	private String treatmentFileName;
	private String treatmentFileRealName;
	
	public String getTreatmentFileNo() {
		return treatmentFileNo;
	}
	public void setTreatmentFileNo(String treatmentFileNo) {
		this.treatmentFileNo = treatmentFileNo;
	}
	public String getTreatmentNo() {
		return treatmentNo;
	}
	public void setTreatmentNo(String treatmentNo) {
		this.treatmentNo = treatmentNo;
	}
	public String getTreatmentFileExt() {
		return treatmentFileExt;
	}
	public void setTreatmentFileExt(String treatmentFileExt) {
		this.treatmentFileExt = treatmentFileExt;
	}
	public long getTreatmentFileSize() {
		return treatmentFileSize;
	}
	public void setTreatmentFileSize(long treatmentFileSize) {
		this.treatmentFileSize = treatmentFileSize;
	}
	public String getTreatmentFileType() {
		return treatmentFileType;
	}
	public void setTreatmentFileType(String treatmentFileType) {
		this.treatmentFileType = treatmentFileType;
	}
	public String getTreatmentFileName() {
		return treatmentFileName;
	}
	public void setTreatmentFileName(String treatmentFileName) {
		this.treatmentFileName = treatmentFileName;
	}
	public String getTreatmentFileRealName() {
		return treatmentFileRealName;
	}
	public void setTreatmentFileRealName(String treatmentFileRealName) {
		this.treatmentFileRealName = treatmentFileRealName;
	}
	@Override
	public String toString() {
		return "TreatmentFile [treatmentFileNo=" + treatmentFileNo + ", treatmentNo=" + treatmentNo
				+ ", treatmentFileExt=" + treatmentFileExt + ", treatmentFileSize=" + treatmentFileSize
				+ ", treatmentFileType=" + treatmentFileType + ", treatmentFileName=" + treatmentFileName
				+ ", treatmentFileRealName=" + treatmentFileRealName + "]";
	}
}
