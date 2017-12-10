package com.godsky.findlove.main.profileboard.model.vo;

public class Profileboard {
	private String user_id; 		//아이디
	private String picture_NM; 		//프로필 사진
	private String user_NickNM;		//닉네임
	private String grade_AVG;   	//평점
	private String gender;			//성별
	private String age;				//나이
	private String area;			//지역
	
	public Profileboard() {}
	
	public Profileboard(String user_id, String picture_NM, String user_NickNM, String grade_AVG, String gender,
			String age, String area) {
		super();
		this.user_id = user_id;
		this.picture_NM = picture_NM;
		this.user_NickNM = user_NickNM;
		this.grade_AVG = grade_AVG;
		this.gender = gender;
		this.age = age;
		this.area = area;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPicture_NM() {
		return picture_NM;
	}

	public void setPicture_NM(String picture_NM) {
		this.picture_NM = picture_NM;
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

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	@Override
	public String toString() {
		return "Profileboard [user_id=" + user_id + ", picture_NM=" + picture_NM + ", user_NickNM=" + user_NickNM
				+ ", grade_AVG=" + grade_AVG + ", gender=" + gender + ", age=" + age + ", area=" + area + "]";
	}
	
}
