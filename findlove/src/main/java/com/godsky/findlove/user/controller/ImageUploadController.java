package com.godsky.findlove.user.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.godsky.findlove.user.model.service.ImageService;
import com.godsky.findlove.user.model.vo.ImageFile;
import com.godsky.findlove.user.model.vo.ImageView;

@Controller
public class ImageUploadController {
	
	@Resource(name="imageView") ImageView imageView;
	
	@Autowired ImageService imageService;
	
	//이미지 업로드를 위한 페이지 매핑
	/*@RequestMapping(value = "imageuploadpage.do")
	private String uploadView(){
		return "user/imageupload";
	}*/
	
	//이미지 업로드 폼에서 전송 시 받게되는 메소드
	@RequestMapping(value = "imageupload.do", method=RequestMethod.POST)
	private String upload(@RequestParam MultipartFile imageFile, ModelMap modelMap){
		ImageFile fileInfo = imageService.save(imageFile);
		
		modelMap.put("imageFile", fileInfo);
		return "user/imageuploadcomplete";
	}
	
	@RequestMapping(value = "image/{imageId}.do")
	private ImageView getImage(@PathVariable String imageId, ModelMap modelMap){
		ImageFile imageFile = imageService.get(imageId);
		
		modelMap.put("imageFile", imageFile);
		
		return imageView;
		}
}
