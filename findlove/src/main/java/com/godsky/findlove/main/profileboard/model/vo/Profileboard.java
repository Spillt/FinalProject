package com.godsky.findlove.main.profileboard.model.vo;

public class Profileboard {
	private String user_id; 		//아이디
	private String user_NickNM;		//닉네임
	private String grade_AVG;   	//평점
	private String picture_NM; 		//프로필 사진
	private String gender;			//성별
	private String age;				//나이
	private String height;				//키
	private String area;			//지역
	private String bodyform;		//체형
	private String achievement;		//학력
	private String job;				//직업
	private String blood_Type;		//혈액형
	private String smoking;			//흡연여부
	private String drinking;		//음주여부
	private String religion;		//종교
	private String style;			//스타일
	
	public Profileboard() {}
	
	public Profileboard(String user_id, String user_NickNM, String grade_AVG, String picture_NM, String gender,
			String age, String height, String area, String bodyform, String achievement, String job, String blood_Type,
			String smoking, String drinking, String religion, String style) {
		super();
		this.user_id = user_id;
		this.user_NickNM = user_NickNM;
		this.grade_AVG = grade_AVG;
		this.picture_NM = picture_NM;
		this.gender = gender;
		this.age = age;
		this.height = height;
		this.area = area;
		this.bodyform = bodyform;
		this.achievement = achievement;
		this.job = job;
		this.blood_Type = blood_Type;
		this.smoking = smoking;
		this.drinking = drinking;
		this.religion = religion;
		this.style = style;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_NickNM() {
		return user_NickNM;
	}

	public void setUser_NickNM(String user_NickNM) {
		this.user_NickNM = user_NickNM;
	}

	public String getGrade_AVG() {
		return grade_AVG;
	}

	public void setGrade_AVG(String grade_AVG) {
		this.grade_AVG = grade_AVG;
	}

	public String getPicture_NM() {
		return picture_NM;
	}

	public void setPicture_NM(String picture_NM) {
		this.picture_NM = picture_NM;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
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

	public String getBlood_Type() {
		return blood_Type;
	}

	public void setBlood_Type(String blood_Type) {
		this.blood_Type = blood_Type;
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
		return "Profileboard [user_id=" + user_id + ", user_NickNM=" + user_NickNM + ", grade_AVG=" + grade_AVG + ", picture_NM=" + picture_NM
				+ ", gender=" + gender + ", age=" + age + ", height=" + height + ", area=" + area +", bodyform=" + bodyform 
				+ ", achievement=" + achievement + ", job=" + job + ", blood_Type=" + blood_Type + ", smoking=" + smoking
				+ ", drinking=" + drinking + ", religion=" + religion + ", style=" + style + "]";
	}
	
}
