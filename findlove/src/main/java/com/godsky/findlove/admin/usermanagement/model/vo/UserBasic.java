package com.godsky.findlove.admin.usermanagement.model.vo;

import java.sql.Date;

public class UserBasic {
	
	private String picture_nm;
	
	private String user_id;
	private String user_nm;
	private String user_nicknm;
	private Date enroll_dt;
	private String rank_gb;
	private String user_st;
	
	public UserBasic() {}
	
	public UserBasic(String picture_nm, String user_id, String user_nm, String user_nicknm, Date enroll_dt,
			String rank_gb, String user_st) {
		super();
		this.picture_nm = picture_nm;
		this.user_id = user_id;
		this.user_nm = user_nm;
		this.user_nicknm = user_nicknm;
		this.enroll_dt = enroll_dt;
		this.rank_gb = rank_gb;
		this.user_st = user_st;
	}

	public String getPicture_nm() {
		return picture_nm;
	}

	public void setPicture_nm(String picture_nm) {
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

	public Date getEnroll_dt() {
		return enroll_dt;
	}

	public void setEnroll_dt(Date enroll_dt) {
		this.enroll_dt = enroll_dt;
	}

	public String getRank_gb() {
		return rank_gb;
	}

	public void setRank_gb(String rank_gb) {
		this.rank_gb = rank_gb;
	}

	public String getUser_st() {
		return user_st;
	}

	public void setUser_st(String user_st) {
		this.user_st = user_st;
	}

	@Override
	public String toString() {
		return "UserBasic [picture_nm=" + picture_nm + ", user_id=" + user_id + ", user_nm=" + user_nm
				+ ", user_nicknm=" + user_nicknm + ", enroll_dt=" + enroll_dt + ", rank_gb=" + rank_gb + ", user_st="
				+ user_st + "]";
	}

}
