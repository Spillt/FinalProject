package com.godsky.findlove.main.eventboard.poll.model.vo;

import java.sql.Date;



public class PollResult {

	private int pollNo;
	private String pollTitle;
	private int result1;
	private int result2;
	private int result3;
	
	public PollResult(int pollNo, String pollTitle, int result1, int result2, int result3) {
		super();
		this.pollNo = pollNo;
		this.pollTitle = pollTitle;
		this.result1 = result1;
		this.result2 = result2;
		this.result3 = result3;
	}

	public int getPollNo() {
		return pollNo;
	}

	public void setPollNo(int pollNo) {
		this.pollNo = pollNo;
	}

	public String getPollTitle() {
		return pollTitle;
	}

	public void setPollTitle(String pollTitle) {
		this.pollTitle = pollTitle;
	}

	public int getResult1() {
		return result1;
	}

	public void setResult1(int result1) {
		this.result1 = result1;
	}

	public int getResult2() {
		return result2;
	}

	public void setResult2(int result2) {
		this.result2 = result2;
	}

	public int getResult3() {
		return result3;
	}

	public void setResult3(int result3) {
		this.result3 = result3;
	}

	@Override
	public String toString() {
		return "pollNo=" + pollNo + ", pollTitle=" + pollTitle + ", result1=" + result1 + ", result2="
				+ result2 + ", result3=" + result3 ;
	}
	
	
	
	
		
}
