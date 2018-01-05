package com.godsky.findlove.main.eventboard.poll.model.vo;

import java.sql.Date;

public class PollResult {

	private int answer;
	private int cnt;

	public PollResult() {
		super();
	}

	public PollResult(int answer, int cnt) {
		super();
		this.answer = answer;
		this.cnt = cnt;
	}

	public int getAnswer() {
		return answer;
	}

	public void setAnswer(int answer) {
		this.answer = answer;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "PollResult [answer=" + answer + ", cnt=" + cnt + "]";
	}

}
