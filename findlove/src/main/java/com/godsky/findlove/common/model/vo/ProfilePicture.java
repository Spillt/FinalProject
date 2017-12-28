package com.godsky.findlove.common.model.vo;

public class ProfilePicture {
	
	private String picture_nm;
	private String user_id;
	private String thumnail_fl;
	
	public ProfilePicture() {}

	public ProfilePicture(String picture_nm, String user_id, String thumnail_fl) {
		super();
		this.picture_nm = picture_nm;
		this.user_id = user_id;
		this.thumnail_fl = thumnail_fl;
	}

	public String getPicture_nm() {
		return picture_nm;
	}

	public void setPicture_nm(String picture_nm) {
		this.picture_nm = picture_nm;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getThumnail_fl() {
		return thumnail_fl;
	}

	public void setThumnail_fl(String thumnail_fl) {
		this.thumnail_fl = thumnail_fl;
	}

	@Override
	public String toString() {
		return "ProfilePicture [picture_nm=" + picture_nm + ", user_id=" + user_id + ", thumnail_fl=" + thumnail_fl
				+ "]";
	};
}
