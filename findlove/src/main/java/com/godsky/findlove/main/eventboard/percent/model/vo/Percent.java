package com.godsky.findlove.main.eventboard.percent.model.vo;

public class Percent {
	private String userId;
	private String userNickNm;
	private int gradeAvg;
	private int count;
	private int rank;
	public Percent() {
		super();
	}
	public Percent(String userId, String userNickNm, int gradeAvg, int count, int rank) {
		super();
		this.userId = userId;
		this.userNickNm = userNickNm;
		this.gradeAvg = gradeAvg;
		this.count = count;
		this.rank = rank;
	}
	public String getUserId() {
		return userId;
	}
	public String getUserNickNm() {
		return userNickNm;
	}
	public int getGradeAvg() {
		return gradeAvg;
	}
	public int getCount() {
		return count;
	}
	public int getRank() {
		return rank;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setUserNickNm(String userNickNm) {
		this.userNickNm = userNickNm;
	}
	public void setGradeAvg(int gradeAvg) {
		this.gradeAvg = gradeAvg;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	@Override
	public String toString() {
		return "Percent [userId=" + userId + ", userNickNm=" + userNickNm + ", gradeAvg=" + gradeAvg + ", count="
				+ count + ", rank=" + rank + "]";
	}

	
}
