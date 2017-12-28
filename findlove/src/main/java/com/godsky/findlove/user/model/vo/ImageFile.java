package com.godsky.findlove.user.model.vo;

public class ImageFile {
	
	//업로드한 이미지 파일이 저장될 경로
	public static final String IMAGE_DIR = "/findlove/uploadfiles/profile";
	
	private String picture_nm;
	private String user_id;
	private String contentType;
	private int contentLength;
	
	public ImageFile(){}
		
	public ImageFile(String picture_nm, String user_id, String contentType, int contentLength) {
		super();
		this.picture_nm = picture_nm;
		this.user_id = user_id;
		this.contentType = contentType;
		this.contentLength = contentLength;
	}

	public static String getImageDir() {
		return IMAGE_DIR;
	}

	public String getPicture_nm() {
		return picture_nm;
	}

	public String getUser_id() {
		return user_id;
	}

	public String getContentType() {
		return contentType;
	}

	public int getContentLength() {
		return contentLength;
	}

	public void setPicture_nm(String picture_nm) {
		this.picture_nm = picture_nm;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public void setContentLength(int contentLength) {
		this.contentLength = contentLength;
	}
	
	
	

	
}