package com.cafe24.kyungsu93.message.service;

public class Message {
	private String sendMessageNo;
	private String sendMessageId;
	private String memberSendNo;
	private String memberReceiveNo;
	private String messageDate;
	private String messageTitle;
	private String messageContent;
	
	
	
	
	public String getSendMessageId() {
		return sendMessageId;
	}
	public void setSendMessageId(String sendMessageId) {
		this.sendMessageId = sendMessageId;
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
	public String getSendMessageNo() {
		return sendMessageNo;
	}
	public void setSendMessageNo(String sendMessageNo) {
		this.sendMessageNo = sendMessageNo;
	}
	public String getMemberSendNo() {
		return memberSendNo;
	}
	public void setMemberSendNo(String memberSendNo) {
		this.memberSendNo = memberSendNo;
	}
	public String getMemberReceiveNo() {
		return memberReceiveNo;
	}
	public void setMemberReceiveNo(String memberReceiveNo) {
		this.memberReceiveNo = memberReceiveNo;
	}
	public String getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(String messageDate) {
		this.messageDate = messageDate;
	}
	@Override
	public String toString() {
		return "Message [sendMessageNo=" + sendMessageNo + ", sendMessageId=" + sendMessageId + ", memberSendNo="
				+ memberSendNo + ", memberReceiveNo=" + memberReceiveNo + ", messageDate=" + messageDate
				+ ", messageTitle=" + messageTitle + ", messageContent=" + messageContent + "]";
	}
	
	
	
	
	
	

}