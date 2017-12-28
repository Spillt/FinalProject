package com.godsky.findlove.main.matchboard.qna.model.vo;

public class MatchUserProfile {

	private String user_id;
	private String user_nm;
	private String rank_gb;
	private String blood_type;
	private String age;
	private String height;
	private String bodyform;
	private String job;
	private String style;
	private String religion;
	private double grade_avg;
	private String area;
	private String picture_nm;
	
	public MatchUserProfile() {
		super();
	}

	public MatchUserProfile(String user_id, String user_nm, String rank_gb, String blood_type, String age,
			String height, String job, String style, String religion, double grade_avg, String area,
			String picture_nm) {
		super();
		this.user_id = user_id;
		this.user_nm = user_nm;
		this.rank_gb = rank_gb;
		this.blood_type = blood_type;
		this.age = age;
		this.height = height;
		this.job = job;
		this.style = style;
		this.religion = religion;
		this.grade_avg = grade_avg;
		this.area = area;
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

	public String getRank_gb() {
		return rank_gb;
	}

	public void setRank_gb(String rank_gb) {
		this.rank_gb = rank_gb;
	}

	public String getBlood_type() {
		return blood_type;
	}

	public void setBlood_type(String blood_type) {
		this.blood_type = blood_type;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getReligion() {
		return religion;
	}

	public void setReligion(String religion) {
		this.religion = religion;
	}

	public double getGrade_avg() {
		return grade_avg;
	}

	public void setGrade_avg(double grade_avg) {
		this.grade_avg = grade_avg;
	}

	public String getBodyform() {
		return bodyform;
	}

	public void setBodyform(String bodyform) {
		this.bodyform = bodyform;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getPicture_nm() {
		return picture_nm;
	}

	public void setPicture_nm(String picture_nm) {
		this.picture_nm = picture_nm;
	}

	@Override
	public String toString(){
		return this.user_id + "," + this.user_nm + "," + this.rank_gb + "," + this.blood_type + "," + this.age + "," + this.height+","
				+ this.job + "," + this.style + "," + this.religion + "," + this.grade_avg + "," + this.area + "," + this.picture_nm
				+ "," + this.bodyform;
	}
	
	
	
}
