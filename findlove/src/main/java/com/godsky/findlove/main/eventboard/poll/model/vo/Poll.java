package com.godsky.findlove.main.eventboard.poll.model.vo;

import java.sql.Date;

public class Poll {

	private int pollNo;
	private String pollTitle;
	private int pollST;
	private Date SDT;
	private Date EDT;
	private int queNo;
	private String queContent;
	private int answer;
	
	public Poll() {
		super();
	}

	public Poll(int pollNo, String pollTitle, int pollST, Date sDT, Date eDT, int queNo, String queContent,
			int answer) {
		super();
		this.pollNo = pollNo;
		this.pollTitle = pollTitle;
		this.pollST = pollST;
		SDT = sDT;
		EDT = eDT;
		this.queNo = queNo;
		this.queContent = queContent;
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

	public int getQueNo() {
		return queNo;
	}

	public void setQueNo(int queNo) {
		this.queNo = queNo;
	}

	public String getQueContent() {
		return queContent;
	}

	public void setQueContent(String queContent) {
		this.queContent = queContent;
	}

	public int getAnswer() {
		return answer;
	}

	public void setAnswer(int answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "pollNo=" + pollNo + ", pollTitle=" + pollTitle + ", pollST=" + pollST + ", SDT=" + SDT + ", EDT="
				+ EDT + ", queNo=" + queNo + ", queContent=" + queContent + ", answer=" + answer;
	}
	
	
	
		
}
