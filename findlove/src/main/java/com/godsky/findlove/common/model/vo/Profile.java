package com.godsky.findlove.common.model.vo;

public class Profile {

	private String gender;
	private int age;
	private int height;
	private int weight;
	private String area;
	private String hobby;
	private String achievement;
	private String blood_type;
	private String smoking;
	private String drinking;
	private String religion;
	private String style;
	private String bodyform;
	
	public Profile() {}

	public Profile(String gender, int age, int height, int weight, String area, String hobby, String achievement,
			String blood_type, String smoking, String drinking, String religion, String style, String bodyform) {
		super();
		this.gender = gender;
		this.age = age;
		this.height = height;
		this.weight = weight;
		this.area = area;
		this.hobby = hobby;
		this.achievement = achievement;
		this.blood_type = blood_type;
		this.smoking = smoking;
		this.drinking = drinking;
		this.religion = religion;
		this.style = style;
		this.bodyform = bodyform;
	}

	public String getGender() {
		return gender;
	}

	public int getAge() {
		return age;
	}

	public int getHeight() {
		return height;
	}

	public int getWeight() {
		return weight;
	}

	public String getArea() {
		return area;
	}

	public String getHobby() {
		return hobby;
	}

	public String getAchievement() {
		return achievement;
	}

	public String getBlood_type() {
		return blood_type;
	}

	public String getSmoking() {
		return smoking;
	}

	public String getDrinking() {
		return drinking;
	}

	public String getReligion() {
		return religion;
	}

	public String getStyle() {
		return style;
	}

	public String getBodyform() {
		return bodyform;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public void setAchievement(String achievement) {
		this.achievement = achievement;
	}

	public void setBlood_type(String blood_type) {
		this.blood_type = blood_type;
	}

	public void setSmoking(String smoking) {
		this.smoking = smoking;
	}

	public void setDrinking(String drinking) {
		this.drinking = drinking;
	}

	public void setReligion(String religion) {
		this.religion = religion;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public void setBodyform(String bodyform) {
		this.bodyform = bodyform;
	}

	@Override
	public String toString() {
		return "Profile [gender=" + gender + ", age=" + age + ", height=" + height + ", weight=" + weight + ", area="
				+ area + ", hobby=" + hobby + ", achievement=" + achievement + ", blood_type=" + blood_type
				+ ", smoking=" + smoking + ", drinking=" + drinking + ", religion=" + religion + ", style=" + style
				+ ", bodyform=" + bodyform + "]";
	}
	
	

	
}
