package com.godsky.findlove.user.model.vo;

import java.sql.Date;




public class User {
	
	private String userId;
	private String userPwd;
	private String userName;
	private String userNickName;
	private char userState;
	private String email;
	private String phone;
	private int pointCNT;
	private int konpeitoCNT;
	private char rankGB;
	private int gradeAVG;
	private Date enrollDT;
	private Date lastestAccessDT;
	private Date deleteDT;
	
	public User(){
		super();
	}
	

	public User(String userId, String userPwd, String userName, String userNickName, char userState, String email) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userNickName = userNickName;
		this.userState = userState;
		this.email = email;
	}

	public User(String userId, String userPwd, String userName, String email) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
	}


	public User(String userId, String userPwd, String userName, String userNickName, char userState, String email,
			Date enrollDT, Date lastestAccessDT, Date deleteDT) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userNickName = userNickName;
		this.userState = userState;
		this.email = email;
		this.enrollDT = enrollDT;
		this.lastestAccessDT = lastestAccessDT;
		this.deleteDT = deleteDT;
	}


	public User(String userId, String phone, int pointCNT, int konpeitoCNT, char rankGB, int gradeAVG) {
		super();
		this.userId = userId;
		this.phone = phone;
		this.pointCNT = pointCNT;
		this.konpeitoCNT = konpeitoCNT;
		this.rankGB = rankGB;
		this.gradeAVG = gradeAVG;
	}


	public String getUserId() {
		return userId;
	}


	public String getUserPwd() {
		return userPwd;
	}


	public String getUserName() {
		return userName;
	}


	public String getUserNickName() {
		return userNickName;
	}


	public char getUserState() {
		return userState;
	}


	public String getEmail() {
		return email;
	}


	public String getPhone() {
		return phone;
	}


	public int getPointCNT() {
		return pointCNT;
	}


	public int getKonpeitoCNT() {
		return konpeitoCNT;
	}


	public char getRankGB() {
		return rankGB;
	}


	public int getGradeAVG() {
		return gradeAVG;
	}


	public Date getEnrollDT() {
		return enrollDT;
	}


	public Date getLastestAccessDT() {
		return lastestAccessDT;
	}


	public Date getDeleteDT() {
		return deleteDT;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}


	public void setUserState(char userState) {
		this.userState = userState;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public void setPointCNT(int pointCNT) {
		this.pointCNT = pointCNT;
	}


	public void setKonpeitoCNT(int konpeitoCNT) {
		this.konpeitoCNT = konpeitoCNT;
	}


	public void setRankGB(char rankGB) {
		this.rankGB = rankGB;
	}


	public void setGradeAVG(int gradeAVG) {
		this.gradeAVG = gradeAVG;
	}


	public void setEnrollDT(Date enrollDT) {
		this.enrollDT = enrollDT;
	}


	public void setLastestAccessDT(Date lastestAccessDT) {
		this.lastestAccessDT = lastestAccessDT;
	}


	public void setDeleteDT(Date deleteDT) {
		this.deleteDT = deleteDT;
	}


	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", userNickName="
				+ userNickName + ", userState=" + userState + ", email=" + email + ", phone=" + phone + ", pointCNT="
				+ pointCNT + ", konpeitoCNT=" + konpeitoCNT + ", rankGB=" + rankGB + ", gradeAVG=" + gradeAVG
				+ ", enrollDT=" + enrollDT + ", lastestAccessDT=" + lastestAccessDT + ", deleteDT=" + deleteDT + "]";
	}
	
	
	

	
	
	
	

}
