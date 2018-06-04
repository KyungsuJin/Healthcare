package com.cafe24.kyungsu93.group.service;

public class GroupInvite {
	private String groupInviteNo;
	private String groupNo;
	private String memberNo;
	private String memeberName;
	private String memverId;
	private String groupInviteApproval;
	private String groupInviteDate;
	private String groupName;
	private String prsonalInformationApproval;
	private String groupInviteApprovalDate;
	private String groupKindName;
	public String getGroupInviteNo() {
		return groupInviteNo;
	}
	public void setGroupInviteNo(String groupInviteNo) {
		this.groupInviteNo = groupInviteNo;
	}
	public String getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(String groupNo) {
		this.groupNo = groupNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemeberName() {
		return memeberName;
	}
	public void setMemeberName(String memeberName) {
		this.memeberName = memeberName;
	}
	public String getMemverId() {
		return memverId;
	}
	public void setMemverId(String memverId) {
		this.memverId = memverId;
	}
	public String getGroupInviteApproval() {
		return groupInviteApproval;
	}
	public void setGroupInviteApproval(String groupInviteApproval) {
		this.groupInviteApproval = groupInviteApproval;
	}
	public String getGroupInviteDate() {
		return groupInviteDate;
	}
	public void setGroupInviteDate(String groupInviteDate) {
		this.groupInviteDate = groupInviteDate;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getPrsonalInformationApproval() {
		return prsonalInformationApproval;
	}
	public void setPrsonalInformationApproval(String prsonalInformationApproval) {
		this.prsonalInformationApproval = prsonalInformationApproval;
	}
	public String getGroupInviteApprovalDate() {
		return groupInviteApprovalDate;
	}
	public void setGroupInviteApprovalDate(String groupInviteApprovalDate) {
		this.groupInviteApprovalDate = groupInviteApprovalDate;
	}
	public String getGroupKindName() {
		return groupKindName;
	}
	public void setGroupKindName(String groupKindName) {
		this.groupKindName = groupKindName;
	}
	@Override
	public String toString() {
		return "GroupInvite [groupInviteNo=" + groupInviteNo + ", groupNo=" + groupNo + ", memberNo=" + memberNo
				+ ", memeberName=" + memeberName + ", memverId=" + memverId + ", groupInviteApproval="
				+ groupInviteApproval + ", groupInviteDate=" + groupInviteDate + ", groupName=" + groupName
				+ ", prsonalInformationApproval=" + prsonalInformationApproval + ", groupInviteApprovalDate="
				+ groupInviteApprovalDate + ", groupKindName=" + groupKindName + "]";
	}
	
}
