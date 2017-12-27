package com.godsky.findlove.main.eventboard.poll.model.vo;

import java.sql.Date;

public class PollAnswer {

	private String user_id;
	private int poll_no;
	private int answer;

	public PollAnswer() {
		super();
	}

	public PollAnswer(String user_id, int poll_no, int answer) {
		super();
		this.user_id = user_id;
		this.poll_no = poll_no;
		this.answer = answer;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getPoll_no() {
		return poll_no;
	}

	public void setPoll_no(int poll_no) {
		this.poll_no = poll_no;
	}

	public int getAnswer() {
		return answer;
	}

	public void setAnswer(int answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "user_id=" + user_id + ", poll_no=" + poll_no + ", answer=" + answer;
	}

}
