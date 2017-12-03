package com.godsky.findlove.main.eventboard.poll.model.vo;

public class Poll {
	
	private String userId; 
	private int pollNo;
	private int quenNo;
	private int Answer;
	
	public Poll() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Poll(String userId, int pollNo, int quenNo, int answer) {
		super();
		this.userId = userId;
		this.pollNo = pollNo;
		this.quenNo = quenNo;
		Answer = answer;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public int getPollNo() {
		return pollNo;
	}


	public void setPollNo(int pollNo) {
		this.pollNo = pollNo;
	}


	public int getQuenNo() {
		return quenNo;
	}


	public void setQuenNo(int quenNo) {
		this.quenNo = quenNo;
	}


	public int getAnswer() {
		return Answer;
	}


	public void setAnswer(int answer) {
		Answer = answer;
	}


	@Override
	public String toString() {
		return "Poll [userId=" + userId + ", pollNo=" + pollNo + ", quenNo=" + quenNo + ", Answer=" + Answer + "]";
	}
	
	

}
