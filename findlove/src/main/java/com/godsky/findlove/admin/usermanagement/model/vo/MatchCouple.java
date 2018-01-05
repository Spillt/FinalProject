package com.godsky.findlove.admin.usermanagement.model.vo;

public class MatchCouple {

	private String sender_id;
	private String receiver_id;
	private String sender_nicknm;
	private String receiver_nicknm;
	
	public MatchCouple() {}

	public MatchCouple(String sender_id, String receiver_id, String sender_nicknm, String receiver_nicknm) {
		super();
		this.sender_id = sender_id;
		this.receiver_id = receiver_id;
		this.sender_nicknm = sender_nicknm;
		this.receiver_nicknm = receiver_nicknm;
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

	public String getSender_nicknm() {
		return sender_nicknm;
	}

	public void setSender_nicknm(String sender_nicknm) {
		this.sender_nicknm = sender_nicknm;
	}

	public String getReceiver_nicknm() {
		return receiver_nicknm;
	}

	public void setReceiver_nicknm(String receiver_nicknm) {
		this.receiver_nicknm = receiver_nicknm;
	}

	@Override
	public String toString() {
		return "MatchCouple [sender_id=" + sender_id + ", receiver_id=" + receiver_id + ", sender_nicknm="
				+ sender_nicknm + ", receiver_nicknm=" + receiver_nicknm + "]";
	}
	
}
