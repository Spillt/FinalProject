package com.godsky.findlove.main.eventboard.poll.model.vo;

import java.sql.Date;



public class Poll {

	private int pollNo;
	private String pollTitle;
	private int pollST;
	private Date SDT;
	private Date EDT;
	private String answer1;
	private String answer2;
	private String answer3;
	
	private int answer;
	
	public Poll() {
		super();
	}

	



	public Poll(int pollNo, String pollTitle, int pollST, Date sDT, Date eDT, String answer1, String answer2,
			String answer3, int answer) {
		super();
		this.pollNo = pollNo;
		this.pollTitle = pollTitle;
		this.pollST = pollST;
		SDT = sDT;
		EDT = eDT;
		this.answer1 = answer1;
		this.answer2 = answer2;
		this.answer3 = answer3;
		this.answer = answer;
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

	public int getPollST() {
		return pollST;
	}

	public void setPollST(int pollST) {
		this.pollST = pollST;
	}

	public Date getSDT() {
		return SDT;
	}

	public void setSDT(Date sDT) {
		SDT = sDT;
	}

	public Date getEDT() {
		return EDT;
	}

	public void setEDT(Date eDT) {
		EDT = eDT;
	}

	

	public int getAnswer() {
		return answer;
	}

	public void setAnswer(int answer) {
		this.answer = answer;
	}





	public String getAnswer1() {
		return answer1;
	}





	public void setAnswer1(String answer1) {
		this.answer1 = answer1;
	}





	public String getAnswer2() {
		return answer2;
	}





	public void setAnswer2(String answer2) {
		this.answer2 = answer2;
	}





	public String getAnswer3() {
		return answer3;
	}





	public void setAnswer3(String answer3) {
		this.answer3 = answer3;
	}





	@Override
	public String toString() {
		return "pollNo=" + pollNo + ", pollTitle=" + pollTitle + ", pollST=" + pollST + ", SDT=" + SDT + ", EDT="
				+ EDT + ", answer1=" + answer1 + ", answer2=" + answer2 + ", answer3=" + answer3 + ", answer=" + answer
				;
	}

	
	
		
}
