package com.godsky.findlove.main.matchboard.iwc.model.vo;

public class Iwc {
	
	private String user_id;
	private String user_nm;
	private String user_nicknm;
	private String picture_nm;
	
	public Iwc() {}

	public Iwc(String user_id, String user_nm, String user_nicknm, String picture_nm) {
		super();
		this.user_id = user_id;
		this.user_nm = user_nm;
		this.user_nicknm = user_nicknm;
		this.picture_nm = picture_nm;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_nm() {
		return user_nm;
	}

	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}

	public String getUser_nicknm() {
		return user_nicknm;
	}

	public void setUser_nicknm(String user_nicknm) {
		this.user_nicknm = user_nicknm;
	}

	public String getPicture_nm() {
		return picture_nm;
	}

	public void setPicture_nm(String picture_nm) {
		this.picture_nm = picture_nm;
	}

	@Override
	public String toString() {
		return "Iwc [user_id=" + user_id + ", user_nm=" + user_nm + ", user_nicknm=" + user_nicknm + ", picture_nm="
				+ picture_nm + "]";
	}
	
}
