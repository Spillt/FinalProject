package com.godsky.findlove.common.model.vo;

public class Profile {
	
	private String user_id;
	private char target_gb;
	private char gender;
	private String age;
	private String height;
	private String area;
	private String bodyform;
	private String achievement;
	private String job;
	private String blood_type;
	private String smoking;
	private String drinking;
	private String religion;
	private String style;
	
	
	public Profile() {}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public char getTarget_gb() {
		return target_gb;
	}


	public void setTarget_gb(char target_gb) {
		this.target_gb = target_gb;
	}


	public char getGender() {
		return gender;
	}


	public void setGender(char gender) {
		this.gender = gender;
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


	public String getArea() {
		return area;
	}


	public void setArea(String area) {
		this.area = area;
	}


	public String getBodyform() {
		return bodyform;
	}


	public void setBodyform(String bodyform) {
		this.bodyform = bodyform;
	}


	public String getAchievement() {
		return achievement;
	}


	public void setAchievement(String achievement) {
		this.achievement = achievement;
	}


	public String getJob() {
		return job;
	}


	public void setJob(String job) {
		this.job = job;
	}


	public String getBlood_type() {
		return blood_type;
	}


	public void setBlood_type(String blood_type) {
		this.blood_type = blood_type;
	}


	public String getSmoking() {
		return smoking;
	}


	public void setSmoking(String smoking) {
		this.smoking = smoking;
	}


	public String getDrinking() {
		return drinking;
	}


	public void setDrinking(String drinking) {
		this.drinking = drinking;
	}


	public String getReligion() {
		return religion;
	}


	public void setReligion(String religion) {
		this.religion = religion;
	}


	public String getStyle() {
		return style;
	}


	public void setStyle(String style) {
		this.style = style;
	}


	@Override
	public String toString() {
		return "Profile [user_id=" + user_id + ", target_gb=" + target_gb + ", gender=" + gender + ", age=" + age
				+ ", height=" + height + ", area=" + area + ", bodyform=" + bodyform + ", achievement=" + achievement
				+ ", job=" + job + ", blood_type=" + blood_type + ", smoking=" + smoking + ", drinking=" + drinking
				+ ", religion=" + religion + ", style=" + style + "]";
	}

	
}