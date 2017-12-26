package com.godsky.findlove.admin.usermanagement.model.vo;

import java.sql.Date;

public class UserDetail {
	
	private String picture_nm;
	
	private String user_id;
	private String user_nm;
	private String user_nicknm;
	private String email;
	private String phone;
	private String enroll_dt;
	private String latest_access_dt;
	private String delete_dt;
	private String rank_gb;
	private String user_st;
	private double grade_avg;
	
	private int favorite_cnt;
	
	public UserDetail() {}

	public UserDetail(String picture_nm, String user_id, String user_nm, String user_nicknm, String email, String phone,
			String enroll_dt, String latest_access_dt, String delete_dt, String rank_gb, String user_st,
			double grade_avg, int favorite_cnt) {
		super();
		this.picture_nm = picture_nm;
		this.user_id = user_id;
		this.user_nm = user_nm;
		this.user_nicknm = user_nicknm;
		this.email = email;
		this.phone = phone;
		this.enroll_dt = enroll_dt;
		this.latest_access_dt = latest_access_dt;
		this.delete_dt = delete_dt;
		this.rank_gb = rank_gb;
		this.user_st = user_st;
		this.grade_avg = grade_avg;
		this.favorite_cnt = favorite_cnt;
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

	public String getEnroll_dt() {
		return enroll_dt;
	}

	public void setEnroll_dt(String enroll_dt) {
		this.enroll_dt = enroll_dt;
	}

	public String getLatest_access_dt() {
		return latest_access_dt;
	}

	public void setLatest_access_dt(String latest_access_dt) {
		this.latest_access_dt = latest_access_dt;
	}

	public String getDelete_dt() {
		return delete_dt;
	}

	public void setDelete_dt(String delete_dt) {
		this.delete_dt = delete_dt;
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

	public double getGrade_avg() {
		return grade_avg;
	}

	public void setGrade_avg(double grade_avg) {
		this.grade_avg = grade_avg;
	}

	public int getFavorite_cnt() {
		return favorite_cnt;
	}

	public void setFavorite_cnt(int favorite_cnt) {
		this.favorite_cnt = favorite_cnt;
	}

	@Override
	public String toString() {
		return "UserDetail [picture_nm=" + picture_nm + ", user_id=" + user_id + ", user_nm=" + user_nm
				+ ", user_nicknm=" + user_nicknm + ", email=" + email + ", phone=" + phone + ", enroll_dt=" + enroll_dt
				+ ", latest_access_dt=" + latest_access_dt + ", delete_dt=" + delete_dt + ", rank_gb=" + rank_gb
				+ ", user_st=" + user_st + ", grade_avg=" + grade_avg + ", favorite_cnt=" + favorite_cnt + "]";
	}

}
