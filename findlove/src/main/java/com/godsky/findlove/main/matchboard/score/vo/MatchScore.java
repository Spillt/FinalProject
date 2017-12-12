package com.godsky.findlove.main.matchboard.score.vo;

import java.io.Serializable;

public class MatchScore implements Serializable {
	private String receiveId;
	private String sendId;
	private int score;
	
	public MatchScore(){
	}
	public MatchScore(String receiveId,String sendId,int score){
		this.receiveId = receiveId;
		this.sendId = sendId;
		this.score = score;
	}
	
	public String getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}
	public String getSendId() {
		return sendId;
	}
	public void setSendId(String sendId) {
		this.sendId = sendId;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	@Override
	public String toString(){
		return this.receiveId + "," + this.sendId + "," + this.score;
	}
}