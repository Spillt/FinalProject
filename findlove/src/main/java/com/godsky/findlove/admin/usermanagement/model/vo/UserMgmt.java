package com.godsky.findlove.admin.usermanagement.model.vo;

import java.sql.Date;

public class UserMgmt {
	
	public UserMgmt() {}
	
	private String user_id;
	private String user_nm;
	private String user_nicknm;
	private String user_st;
	private String email;
	private String phone;
	private String rank_gb;
	private String grade_avg;
	private Date enroll_dt;
	private Date delete_dt;
	
	private String picture_nm;
	
	private int favorite_cnt;

	public UserMgmt(String user_id, String user_nm, String user_nicknm, String user_st, String email, String phone,
			String rank_gb, String grade_avg, Date enroll_dt, Date delete_dt, String picture_nm, int favorite_cnt) {
		super();
		this.user_id = user_id;
		this.user_nm = user_nm;
		this.user_nicknm = user_nicknm;
		this.user_st = user_st;
		this.email = email;
		this.phone = phone;
		this.rank_gb = rank_gb;
		this.grade_avg = grade_avg;
		this.enroll_dt = enroll_dt;
		this.delete_dt = delete_dt;
		this.picture_nm = picture_nm;
		this.favorite_cnt = favorite_cnt;
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

	public String getUser_st() {
		return user_st;
	}

	public void setUser_st(String user_st) {
		this.user_st = user_st;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRank_gb() {
		return rank_gb;
	}

	public void setRank_gb(String rank_gb) {
		this.rank_gb = rank_gb;
	}

	public String getGrade_avg() {
		return grade_avg;
	}

	public void setGrade_avg(String grade_avg) {
		this.grade_avg = grade_avg;
	}

	public Date getEnroll_dt() {
		return enroll_dt;
	}

	public void setEnroll_dt(Date enroll_dt) {
		this.enroll_dt = enroll_dt;
	}

	public Date getDelete_dt() {
		return delete_dt;
	}

	public void setDelete_dt(Date delete_dt) {
		this.delete_dt = delete_dt;
	}

	public String getPicture_nm() {
		return picture_nm;
	}

	public void setPicture_nm(String picture_nm) {
		this.picture_nm = picture_nm;
	}

	public int getFavorite_cnt() {
		return favorite_cnt;
	}

	public void setFavorite_cnt(int favorite_cnt) {
		this.favorite_cnt = favorite_cnt;
	}

	@Override
	public String toString() {
		return "UserMgmt [user_id=" + user_id + ", user_nm=" + user_nm + ", user_nicknm=" + user_nicknm + ", user_st="
				+ user_st + ", email=" + email + ", phone=" + phone + ", rank_gb=" + rank_gb + ", grade_avg="
				+ grade_avg + ", enroll_dt=" + enroll_dt + ", delete_dt=" + delete_dt + ", picture_nm=" + picture_nm
				+ ", favorite_cnt=" + favorite_cnt + "]";
	}
	
	

}
