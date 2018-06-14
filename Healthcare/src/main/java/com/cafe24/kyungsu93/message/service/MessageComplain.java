package com.cafe24.kyungsu93.message.service;

public class MessageComplain {
	private String complainNo;
	private String sendMessageNo;
	private String messageTitle;
	private String messageContent;
	private String complainReason;
	private String complainDate;
	private String memberReceiveNo;
	private String memberSendNo;
	private String sendMessageDate;
	private String processingProgress;
	
	
	
	
	
	public String getProcessingProgress() {
		return processingProgress;
	}
	public void setProcessingProgress(String processingProgress) {
		this.processingProgress = processingProgress;
	}
	public String getSendMessageDate() {
		return sendMessageDate;
	}
	public void setSendMessageDate(String sendMessageDate) {
		this.sendMessageDate = sendMessageDate;
	}
	public String getMemberReceiveNo() {
		return memberReceiveNo;
	}
	public void setMemberReceiveNo(String memberReceiveNo) {
		this.memberReceiveNo = memberReceiveNo;
	}
	public String getMemberSendNo() {
		return memberSendNo;
	}
	public void setMemberSendNo(String memberSendNo) {
		this.memberSendNo = memberSendNo;
	}
	public String getComplainNo() {
		return complainNo;
	}
	public void setComplainNo(String complainNo) {
		this.complainNo = complainNo;
	}
	public String getSendMessageNo() {
		return sendMessageNo;
	}
	public void setSendMessageNo(String sendMessageNo) {
		this.sendMessageNo = sendMessageNo;
	}
	public String getMessageTitle() {
		return messageTitle;
	}
	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public String getComplainReason() {
		return complainReason;
	}
	public void setComplainReason(String complainReason) {
		this.complainReason = complainReason;
	}
	public String getComplainDate() {
		return complainDate;
	}
	public void setComplainDate(String complainDate) {
		this.complainDate = complainDate;
	}
	
	@Override
	public String toString() {
		return "MessageComplain [complainNo=" + complainNo + ", sendMessageNo=" + sendMessageNo + ", messageTitle="
				+ messageTitle + ", messageContent=" + messageContent + ", complainReason=" + complainReason
				+ ", complainDate=" + complainDate + ", memberReceiveNo=" + memberReceiveNo + ", memberSendNo="
				+ memberSendNo + ", sendMessageDate=" + sendMessageDate + ", processingProgress=" + processingProgress
				+ "]";
	}
	

}
