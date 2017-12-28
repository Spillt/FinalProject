package com.godsky.findlove.user.model.vo;

import java.sql.Date;

public class User {
	
	private String user_id; 
	private String user_pwd; 
	private String user_nm;
	private String user_nicknm;
	private char user_st;
	private String email;
	private String phone;
	private int point_cnt;
	private int konpeito_cnt;
	private char rank_gb;
	private int grade_avg;
	private Date enroll_ct;
	private Date lastest_access_dt;
	private Date delete_dt;
	
	public User() {
		super();
	}

	public User(String user_id, String user_pwd, String user_nm, String user_nicknm, char user_st, String email,
			String phone, int point_cnt, int konpeito_cnt, char rank_gb, int grade_avg, Date enroll_ct,
			Date lastest_access_dt, Date delete_dt) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_nm = user_nm;
		this.user_nicknm = user_nicknm;
		this.user_st = user_st;
		this.email = email;
		this.phone = phone;
		this.point_cnt = point_cnt;
		this.konpeito_cnt = konpeito_cnt;
		this.rank_gb = rank_gb;
		this.grade_avg = grade_avg;
		this.enroll_ct = enroll_ct;
		this.lastest_access_dt = lastest_access_dt;
		this.delete_dt = delete_dt;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
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

	public char getUser_st() {
		return user_st;
	}

	public void setUser_st(char user_st) {
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

	public int getPoint_cnt() {
		return point_cnt;
	}

	public void setPoint_cnt(int point_cnt) {
		this.point_cnt = point_cnt;
	}

	public int getKonpeito_cnt() {
		return konpeito_cnt;
	}

	public void setKonpeito_cnt(int konpeito_cnt) {
		this.konpeito_cnt = konpeito_cnt;
	}

	public char getRank_gb() {
		return rank_gb;
	}

	public void setRank_gb(char rank_gb) {
		this.rank_gb = rank_gb;
	}

	public int getGrade_avg() {
		return grade_avg;
	}

	public void setGrade_avg(int grade_avg) {
		this.grade_avg = grade_avg;
	}

	public Date getEnroll_ct() {
		return enroll_ct;
	}

	public void setEnroll_ct(Date enroll_ct) {
		this.enroll_ct = enroll_ct;
	}

	public Date getLastest_access_dt() {
		return lastest_access_dt;
	}

	public void setLastest_access_dt(Date lastest_access_dt) {
		this.lastest_access_dt = lastest_access_dt;
	}

	public Date getDelete_dt() {
		return delete_dt;
	}

	public void setDelete_dt(Date delete_dt) {
		this.delete_dt = delete_dt;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_nm=" + user_nm + ", user_nicknm="
				+ user_nicknm + ", user_st=" + user_st + ", email=" + email + ", phone=" + phone + ", point_cnt="
				+ point_cnt + ", konpeito_cnt=" + konpeito_cnt + ", rank_gb=" + rank_gb + ", grade_avg=" + grade_avg
				+ ", enroll_ct=" + enroll_ct + ", lastest_access_dt=" + lastest_access_dt + ", delete_dt=" + delete_dt
				+ "]";
	}
	
	
}
