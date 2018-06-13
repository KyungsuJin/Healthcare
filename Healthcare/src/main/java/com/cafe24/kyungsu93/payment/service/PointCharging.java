package com.cafe24.kyungsu93.payment.service;

public class PointCharging {
	private String pointChargingNo;
	private String memberNo;
	private String memberName;
	private String memberId;
	private String pointChargingSum;
	private String pointChargingDate;
	private String pointChargingDirectorNo;
	private String pointChargingApproval;
	private String pointChargingApprovalDate;
	public String getPointChargingNo() {
		return pointChargingNo;
	}
	public void setPointChargingNo(String pointChargingNo) {
		this.pointChargingNo = pointChargingNo;
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
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPointChargingSum() {
		return pointChargingSum;
	}
	public void setPointChargingSum(String pointChargingSum) {
		this.pointChargingSum = pointChargingSum;
	}
	public String getPointChargingDate() {
		return pointChargingDate;
	}
	public void setPointChargingDate(String pointChargingDate) {
		this.pointChargingDate = pointChargingDate;
	}
	public String getPointChargingDirectorNo() {
		return pointChargingDirectorNo;
	}
	public void setPointChargingDirectorNo(String pointChargingDirectorNo) {
		this.pointChargingDirectorNo = pointChargingDirectorNo;
	}
	public String getPointChargingApproval() {
		return pointChargingApproval;
	}
	public void setPointChargingApproval(String pointChargingApproval) {
		this.pointChargingApproval = pointChargingApproval;
	}
	public String getPointChargingApprovalDate() {
		return pointChargingApprovalDate;
	}
	public void setPointChargingApprovalDate(String pointChargingApprovalDate) {
		this.pointChargingApprovalDate = pointChargingApprovalDate;
	}
	@Override
	public String toString() {
		return "Refund [pointChargingNo=" + pointChargingNo + ", memberNo=" + memberNo + ", memberName=" + memberName
				+ ", memberId=" + memberId + ", pointChargingSum=" + pointChargingSum + ", pointChargingDate="
				+ pointChargingDate + ", pointChargingDirectorNo=" + pointChargingDirectorNo
				+ ", pointChargingApproval=" + pointChargingApproval + ", pointChargingApprovalDate="
				+ pointChargingApprovalDate + "]";
	}
}
