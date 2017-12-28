package com.godsky.findlove.user.model.vo;

public class Profile {
	
	private char gender;
	private int age;
	private int height;
	private int weight;
	private String area;
	private String hobby;
	private String achievement;
	private char blood_Type;
	private String smoking;
	private String drinking;
	private String religion;
	private String style;
	
	public Profile(){
		super();		
	}

	public Profile(char gender, int age, int height, int weight, String area, String hobby, String achievement,
			char blood_Type, String smoking, String drinking, String religion, String style) {
		super();
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

	public char getGender() {
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

	public char getBloodType() {
		return blood_Type;
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

	public void setGender(char gender) {
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

	public void setBloodType(char bloodType) {
		this.blood_Type = blood_Type;
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

	@Override
	public String toString() {
		return "Profile [gender=" + gender + ", age=" + age + ", height=" + height + ", weight=" + weight + ", area="
				+ area + ", hobby=" + hobby + ", achievement=" + achievement + ", blood_Type=" + blood_Type + ", smoking="
				+ smoking + ", drinking=" + drinking + ", religion=" + religion + ", style=" + style + "]";
	}
	
	

}
