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
	
	public Profile() {}

	public Profile(String gender, int age, int height, int weight, String area, String hobby, String achievement,
			String blood_type, String smoking, String drinking, String religion, String style) {
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
		return "Profile [gender=" + gender + ", age=" + age + ", height=" + height + ", weight=" + weight + ", area="
				+ area + ", hobby=" + hobby + ", achievement=" + achievement + ", blood_type=" + blood_type
				+ ", smoking=" + smoking + ", drinking=" + drinking + ", religion=" + religion + ", style=" + style
				+ "]";
	}
}
