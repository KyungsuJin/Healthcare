package com.cafe24.kyungsu93.helper.service;


public class ComplainEvidenceFile {
	private String complaineEvidenceFileNo;
	private String complainNo;
	private String complaineEvidenceFileExt;
	private int complaineEvidenceFileSize;
	private String complaineEvidenceFileName;
	private String complaineEvidenceFileType;
	private String complaineEvidenceFileDate;
	public String getComplaineEvidenceFileNo() {
		return complaineEvidenceFileNo;
	}
	public void setComplaineEvidenceFileNo(String complaineEvidenceFileNo) {
		this.complaineEvidenceFileNo = complaineEvidenceFileNo;
	}
	public String getComplainNo() {
		return complainNo;
	}
	public void setComplainNo(String complainNo) {
		this.complainNo = complainNo;
	}
	public String getComplaineEvidenceFileExt() {
		return complaineEvidenceFileExt;
	}
	public void setComplaineEvidenceFileExt(String complaineEvidenceFileExt) {
		this.complaineEvidenceFileExt = complaineEvidenceFileExt;
	}
	public int getComplaineEvidenceFileSize() {
		return complaineEvidenceFileSize;
	}
	public void setComplaineEvidenceFileSize(int complaineEvidenceFileSize) {
		this.complaineEvidenceFileSize = complaineEvidenceFileSize;
	}
	public String getComplaineEvidenceFileName() {
		return complaineEvidenceFileName;
	}
	public void setComplaineEvidenceFileName(String complaineEvidenceFileName) {
		this.complaineEvidenceFileName = complaineEvidenceFileName;
	}
	public String getComplaineEvidenceFileType() {
		return complaineEvidenceFileType;
	}
	public void setComplaineEvidenceFileType(String complaineEvidenceFileType) {
		this.complaineEvidenceFileType = complaineEvidenceFileType;
	}
	public String getComplaineEvidenceFileDate() {
		return complaineEvidenceFileDate;
	}
	public void setComplaineEvidenceFileDate(String complaineEvidenceFileDate) {
		this.complaineEvidenceFileDate = complaineEvidenceFileDate;
	}
	@Override
	public String toString() {
		return "ComplainEvienceFile [complaineEvidenceFileNo=" + complaineEvidenceFileNo + ", complainNo=" + complainNo
				+ ", complaineEvidenceFileExt=" + complaineEvidenceFileExt + ", complaineEvidenceFileSize="
				+ complaineEvidenceFileSize + ", complaineEvidenceFileName=" + complaineEvidenceFileName
				+ ", complaineEvidenceFileType=" + complaineEvidenceFileType + ", complaineEvidenceFileDate="
				+ complaineEvidenceFileDate + "]";
	}
	
	
}

