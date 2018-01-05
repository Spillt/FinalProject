package com.godsky.findlove.main.matchboard.iwc.model.vo;

import java.util.List;


public class IdealWorldCup {
	private String userId; // 유저아이디
	private String gender; // 성별
	private int level; // 등급
	private String picturenm; // 사진

	public IdealWorldCup() {
		super();
	}

	public IdealWorldCup(String userId, String gender, int level, String picturenm) {
		super();
		this.userId = userId;
		this.gender = gender;
		this.level = level;
		this.picturenm = picturenm;
	}

	public String getUserId() {
		return userId;
	}

	public String getGender() {
		return gender;
	}

	public int getlevel() {
		return level;
	}

	public String getPicturenm() {
		return picturenm;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setlevel(int level) {
		this.level = level;
	}

	public void setPicturenm(String picturenm) {
		this.picturenm = picturenm;
	}

	@Override
	public String toString() {
		return "IdealWorldCup [userId=" + userId + ", gender=" + gender + ", level=" + level + ", picturenm=" + picturenm
				+ "]";
	}
}
