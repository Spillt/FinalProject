package com.godsky.findlove.main.profileboard.model.vo;

import java.sql.Date;

public class Message {
	private int messageNo;
	private String senderId;
	private String receiverId;
	private String messageContent;
	private Date sendDT;
	private String readFL;
	private String acceptST;
	
	public Message() {}

	public Message(String senderId, String receiverId, String messageContent) {
		super();
		this.senderId = senderId;
		this.receiverId = receiverId;
		this.messageContent = messageContent;
	}

	public Message(int messageNo, String senderId, String receiverId, String messageContent, Date sendDT, String readFL,
			String acceptST) {
		super();
		this.messageNo = messageNo;
		this.senderId = senderId;
		this.receiverId = receiverId;
		this.messageContent = messageContent;
		this.sendDT = sendDT;
		this.readFL = readFL;
		this.acceptST = acceptST;
	}

	public int getMessageNo() {
		return messageNo;
	}

	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public String getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public Date getSendDT() {
		return sendDT;
	}

	public void setSendDT(Date sendDT) {
		this.sendDT = sendDT;
	}

	public String getReadFL() {
		return readFL;
	}

	public void setReadFL(String readFL) {
		this.readFL = readFL;
	}

	public String getAcceptST() {
		return acceptST;
	}

	public void setAcceptST(String acceptST) {
		this.acceptST = acceptST;
	}

	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", senderId=" + senderId + ", receiverId=" + receiverId
				+ ", messageContent=" + messageContent + ", sendDT=" + sendDT 
				+ ", readFL=" + readFL + ", acceptST=" + acceptST + "]";
	}
	
}
