package com.godsky.findlove.main.profileboard.model.vo;

public class Check {
	private String userId;
	private int num;
	
	public Check() {}

	public Check(String userId, int num) {
		super();
		this.userId = userId;
		this.num = num;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	@Override 
	public String toString() {
		return "Check[ userId=" + userId + ", num=" + num + "]";
	}
}
