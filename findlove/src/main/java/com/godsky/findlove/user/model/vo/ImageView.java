package com.godsky.findlove.user.model.vo;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

@Component("imageView")
public class ImageView extends AbstractView{
	
	@Override
	protected void renderMergedOutputModel(Map mode1, 
			HttpServletRequest req, HttpServletResponse res) throws Exception{
		ImageFile imageFile = (ImageFile)mode1.get("imageFile");
		
		//응답 메세지에 파일의 길이를  넘겨줌
		res.setContentLength(imageFile.getContentLength());
		
		//응답의 타입이 이미지
		res.setContentType(imageFile.getContentType());
		
		//파일로 부터 byte 읽어오기
		byte[] bytes = readFile(imageFile.getPicture_nm());
		write(res, bytes);
	}
	
	//파일로 부터 byte 배열 읽어오기
	private byte[] readFile(String fileName) throws IOException{
		String path = ImageFile.IMAGE_DIR + fileName;
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(path));
		int length = bis.available();
		byte[] bytes = new byte[length];
		bis.read(bytes);
		bis.close();
		
		return bytes;
		
	}
	
	//응답 outputstream에 파일 내용 쓰기
	private void write(HttpServletResponse res, byte[] bytes) throws IOException{
		OutputStream output = res.getOutputStream();
		output.write(bytes);
		output.flush();
	}



}
