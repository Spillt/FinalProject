package com.godsky.findlove.common.model.vo;

import java.sql.Date;

public class Poll {
	
	private int poll_no;
	private String poll_title;
	private String poll_st;
	private Date start_dt;
	private Date end_dt;
	private String answer1;
	private String answer2;
	private String answer3;
	
	public Poll() {
		super();
	}
	public Poll(int poll_no, String poll_title, String poll_st, Date start_dt, Date end_dt, String answer1,
			String answer2, String answer3) {
		super();
		this.poll_no = poll_no;
		this.poll_title = poll_title;
		this.poll_st = poll_st;
		this.start_dt = start_dt;
		this.end_dt = end_dt;
		this.answer1 = answer1;
		this.answer2 = answer2;
		this.answer3 = answer3;
	}
	public int getPoll_no() {
		return poll_no;
	}
	public void setPoll_no(int poll_no) {
		this.poll_no = poll_no;
	}
	public String getPoll_title() {
		return poll_title;
	}
	public void setPoll_title(String poll_title) {
		this.poll_title = poll_title;
	}
	public String getPoll_st() {
		return poll_st;
	}
	public void setPoll_st(String poll_st) {
		this.poll_st = poll_st;
	}
	public Date getStart_dt() {
		return start_dt;
	}
	public void setStart_dt(Date start_dt) {
		this.start_dt = start_dt;
	}
	public Date getEnd_dt() {
		return end_dt;
	}
	public void setEnd_dt(Date end_dt) {
		this.end_dt = end_dt;
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
		return "Poll [poll_no=" + poll_no + ", poll_title=" + poll_title + ", poll_st=" + poll_st + ", start_dt="
				+ start_dt + ", end_dt=" + end_dt + ", answer1=" + answer1 + ", answer2=" + answer2 + ", answer3="
				+ answer3 + "]";
	}
	
}
