package com.godsky.findlove.main.profileboard.model.vo;

public class Grade {
	private String sender_id;
	private String receiver_id;
	private int grade;
	
	public Grade() {}
	
	public Grade(String sender_id, String receiver_id, int grade) {
		super();
		this.sender_id = sender_id;
		this.receiver_id = receiver_id;
		this.grade = grade;
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

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "Grade [sender_id=" + sender_id + ", receiver_id=" + receiver_id
				+ ", grade=" + grade + "]";
	}
}
