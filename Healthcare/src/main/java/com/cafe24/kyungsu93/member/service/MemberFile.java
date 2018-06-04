package com.cafe24.kyungsu93.member.service;

public class MemberFile {
	private String memberNo;
	private String memberFileExt;
	private long memberFileSize;
	private String memberFileName;
	private String memberFileType;
	private String memberFileRealName;
	
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberFileExt() {
		return memberFileExt;
	}
	public void setMemberFileExt(String memberFileExt) {
		this.memberFileExt = memberFileExt;
	}
	public long getMemberFileSize() {
		return memberFileSize;
	}
	public void setMemberFileSize(long memberFileSize) {
		this.memberFileSize = memberFileSize;
	}
	public String getMemberFileName() {
		return memberFileName;
	}
	public void setMemberFileName(String memberFileName) {
		this.memberFileName = memberFileName;
	}
	public String getMemberFileType() {
		return memberFileType;
	}
	public void setMemberFileType(String memberFileType) {
		this.memberFileType = memberFileType;
	}
	public String getMemberFileRealName() {
		return memberFileRealName;
	}
	public void setMemberFileRealName(String memberFileRealName) {
		this.memberFileRealName = memberFileRealName;
	}
	@Override
	public String toString() {
		return "MemberFile [memberNo=" + memberNo + ", memberFileExt=" + memberFileExt + ", memberFileSize="
				+ memberFileSize + ", memberFileName=" + memberFileName + ", memberFileType=" + memberFileType
				+ ", memberFileRealName=" + memberFileRealName + "]";
	}
	

	
}
