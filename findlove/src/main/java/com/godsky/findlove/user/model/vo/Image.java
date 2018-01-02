package com.godsky.findlove.user.model.vo;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class Image {
	
	private String picture_nm;
	private String user_id;
	private char thumnail_fl;
	
	public Image(){}
	
	
	public Image(String picture_nm, String user_id, char thumnail_fl) {
		super();
		this.picture_nm = picture_nm;
		this.user_id = user_id;
		this.thumnail_fl = thumnail_fl;
	}


	public String getPicture_nm() {
		return picture_nm;
	}


	public String getUser_id() {
		return user_id;
	}


	public char getThumnail_fl() {
		return thumnail_fl;
	}


	public void setPicture_nm(String picture_nm) {
		this.picture_nm = picture_nm;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public void setThumnail_fl(char thumnail_fl) {
		this.thumnail_fl = thumnail_fl;
	}


	// 이미지 업로드
	public boolean imageUpload(MultipartHttpServletRequest mRequest){
		boolean isUpload = false;
		
		String uploadPath = "";
		Iterator<String> iterator = mRequest.getFileNames();
		
		while(iterator.hasNext()){
			String picture_nm = iterator.next();
			
			MultipartFile mFile = mRequest.getFile(picture_nm);
			String originFileName = mFile.getOriginalFilename();
			String saveFileName = originFileName;
			
			if(saveFileName!=null&&!saveFileName.equals("")){
				if(new File(uploadPath+saveFileName).exists()){
					saveFileName=saveFileName+"_"+System.currentTimeMillis();
				}
				
				try{
					mFile.transferTo(new File(uploadPath+saveFileName));
					isUpload=true;
				}catch(IllegalStateException e){
					e.printStackTrace();
					isUpload=false;
				}catch(IOException e){
					e.printStackTrace();
					isUpload=false;
				}
			}
		}
		return isUpload;
		
	}

	
	
	
	


}
