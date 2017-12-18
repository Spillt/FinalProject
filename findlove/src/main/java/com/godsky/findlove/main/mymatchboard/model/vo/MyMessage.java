package com.godsky.findlove.main.mymatchboard.model.vo;

import java.sql.Date;

public class MyMessage {
	private int message_no;
	private String user_nicknm;
	private String sender_id;
	private String receiver_id;
	private String message_content;
	private Date send_DT;
	private String read_FL;
	private String accept_ST;
	
	public MyMessage() {}
	
	public MyMessage(String sender_id) {
		super();
		this.sender_id = sender_id;
	}

	public MyMessage(int message_no, String user_nicknm, String sender_id, String receiver_id, String message_content,
			Date send_DT, String read_FL, String accept_ST) {
		super();
		this.message_no = message_no;
		this.user_nicknm = user_nicknm;
		this.sender_id = sender_id;
		this.receiver_id = receiver_id;
		this.message_content = message_content;
		this.send_DT = send_DT;
		this.read_FL = read_FL;
		this.accept_ST = accept_ST;
	}

	public int getMessage_no() {
		return message_no;
	}

	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}

	public String getUser_nicknm() {
		return user_nicknm;
	}

	public void setUser_nicknm(String user_nicknm) {
		this.user_nicknm = user_nicknm;
	}

	public String getSender_id() {
		return sender_id;
	}

	public void setSender_id(String sender_id) {
		this.sender_id = sender_id;
	}

	public String getReceiver_id() {
		return receiver_id;
	}

	public void setReceiver_id(String receiver_id) {
		this.receiver_id = receiver_id;
	}

	public String getMessage_content() {
		return message_content;
	}

	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}

	public Date getSend_DT() {
		return send_DT;
	}

	public void setSend_DT(Date send_DT) {
		this.send_DT = send_DT;
	}

	public String getRead_FL() {
		return read_FL;
	}

	public void setRead_FL(String read_FL) {
		this.read_FL = read_FL;
	}

	public String getAccept_ST() {
		return accept_ST;
	}

	public void setAccept_ST(String accept_ST) {
		this.accept_ST = accept_ST;
	}

	@Override
	public String toString() {
		return "Message [message_no=" + message_no + ", user_nicknm=" + user_nicknm + ", sender_id=" + sender_id + ", receiver_id=" + receiver_id
				+ ", message_content=" + message_content + ", send_DT=" + send_DT 
				+ ", read_FL=" + read_FL + ", accept_ST=" + accept_ST + "]";
	}
	
}
