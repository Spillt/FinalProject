package com.godsky.findlove.user.model.vo;

public class ImageFile {
	
	//업로드한 이미지 파일이 저장될 경로
	public static final String IMAGE_DIR = "/web/upload_images";
	
	private String Id;
	private String contentType;
	private int contentLength;
	private String fileName;
	
	public ImageFile(){}

	public ImageFile(String id, String contentType, int contentLength, String fileName) {
		super();
		this.Id = id;
		this.contentType = contentType;
		this.contentLength = contentLength;
		this.fileName = fileName;
	}

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public int getContentLength() {
		return contentLength;
	}

	public void setContentLength(int contentLength) {
		this.contentLength = contentLength;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
	

}
