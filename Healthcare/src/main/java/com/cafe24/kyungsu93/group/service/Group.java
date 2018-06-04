package com.cafe24.kyungsu93.group.service;

public class Group {
	private String groupNo;
	private String groupKindNo;
	private String groupKindName;
	private String memberId;
	private String memberNo;
	private String memberName;
	private String groupName;
	private String groupCreateDate;
	public String getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(String groupNo) {
		this.groupNo = groupNo;
	}
	public String getGroupKindNo() {
		return groupKindNo;
	}
	public void setGroupKindNo(String groupKindNo) {
		this.groupKindNo = groupKindNo;
	}
	public String getGroupKindName() {
		return groupKindName;
	}
	public void setGroupKindName(String groupKindName) {
		this.groupKindName = groupKindName;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getGroupCreateDate() {
		return groupCreateDate;
	}
	public void setGroupCreateDate(String groupCreateDate) {
		this.groupCreateDate = groupCreateDate;
	}
	@Override
	public String toString() {
		return "Group [groupNo=" + groupNo + ", groupKindNo=" + groupKindNo + ", groupKindName=" + groupKindName
				+ ", memberId=" + memberId + ", memberNo=" + memberNo + ", memberName=" + memberName + ", groupName="
				+ groupName + ", groupCreateDate=" + groupCreateDate + "]";
	}
	
}
