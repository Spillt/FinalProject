package com.godsky.findlove.main.matchboard.qna.model.vo;

import java.io.Serializable;

public class MatchQnA implements Serializable {
	private String userId;
	private int question;
	private String answer1;
	private String answer2;
	private String answer3;
	
	public MatchQnA() {
		super();
	}

	public MatchQnA(int question,String answer1,String answer2,String answer3){
		this.question = question;
		this.answer1 = answer1;
		this.answer2 = answer2;
		this.answer3 = answer3;
	}
	public MatchQnA(String userId,int question,String answer1){
		this.userId = userId;
		this.question = question;
		this.answer1 = answer1;
	}
	public MatchQnA(String userId,String answer1){
		this.userId = userId;
		this.answer1 = answer1;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getQuestion() {
		return question;
	}

	public void setQuestion(int question) {
		this.question = question;
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
	public String toString(){
		return this.userId + "," + this.question + "," + this.answer1 + "," + this.answer2 + "," + this.answer3;
	}
}