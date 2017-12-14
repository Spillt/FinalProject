package com.godsky.findlove.main.profileboard.model.vo;

public class Profileboard {
	private String user_id; 		//아이디
	private String user_NickNM;		//닉네임
	private String grade_AVG;   	//평점
	private String picture_NM; 		//프로필 사진
	private String gender;			//성별
	private int age;				//나이
	private int height;				//키
	private int weight;				//몸무게
	private String area;			//지역
	private String hobby;			//취미
	private String achievement;		//학력
	private String blood_Type;		//혈액형
	private String smoking;			//흡연여부
	private String drinking;		//음주여부
	private String religion;		//종교
	private String style;			//스타일
	
	public Profileboard() {}
	
	public Profileboard(String user_id, String user_NickNM, String grade_AVG, String picture_NM, String gender, int age,
			int height, int weight, String area, String hobby, String achievement, String blood_Type, String smoking,
			String drinking, String religion, String style) {
		super();
		this.user_id = user_id;
		this.user_NickNM = user_NickNM;
		this.grade_AVG = grade_AVG;
		this.picture_NM = picture_NM;
		this.gender = gender;
		this.age = age;
		this.height = height;
		this.weight = weight;
		this.area = area;
		this.hobby = hobby;
		this.achievement = achievement;
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

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getAchievement() {
		return achievement;
	}

	public void setAchievement(String achievement) {
		this.achievement = achievement;
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
				+ ", gender=" + gender + ", age=" + age + ", height=" + height + ", weight=" + weight + ", area=" + area
				+ ", hobby=" + hobby + ", achievement=" + achievement + ", blood_Type=" + blood_Type + ", smoking=" + smoking
				+ ", drinking=" + drinking + ", religion=" + religion + ", style=" + style + "]";
	}
	
}
