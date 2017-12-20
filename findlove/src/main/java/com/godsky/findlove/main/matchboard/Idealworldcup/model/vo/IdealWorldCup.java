package com.godsky.findlove.main.matchboard.Idealworldcup.model.vo;

import java.util.List;

public class IdealWorldCup {
	private String UserId;	//유저아이디
	private String Gender;	//성별
	private String Picture;	//유저사진
	private String Message; //1등이상형메세지
	
	public IdealWorldCup() {
		super();
	}

	public IdealWorldCup(String userId, String gender, String picture, String message) {
		super();
		UserId = userId;
		Gender = gender;
		Picture = picture;
		Message = message;
	}

	public String getUserId() {
		return UserId;
	}

	public String getGender() {
		return Gender;
	}

	public String getPicture() {
		return Picture;
	}

	public String getMessage() {
		return Message;
	}

	public void setUserId(String userId) {
		UserId = userId;
	}

	public void setGender(String gender) {
		Gender = gender;
	}

	public void setPicture(String picture) {
		Picture = picture;
	}

	public void setMessage(String message) {
		Message = message;
	}

	@Override
	public String toString() {
		
		return UserId + ", " + Gender + ", " + Picture + ", " + Message; 
	}

	public static List<IdealWorldCup> listAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
