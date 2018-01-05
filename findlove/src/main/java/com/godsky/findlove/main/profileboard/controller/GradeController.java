package com.godsky.findlove.main.profileboard.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.godsky.findlove.main.profileboard.model.service.GradeService;
import com.godsky.findlove.main.profileboard.model.vo.Grade;

/**
 * Handles requests for the application home page.
 */
@Controller
public class GradeController {
	
	public GradeController() {}
	
	@Resource(name="gradeService")
	private GradeService gradeService;
	
	@RequestMapping("/sendGrade.do")
	public void sendGrade(HttpServletResponse response, @RequestParam("sender")String sender, @RequestParam("reciever")String reciever, @RequestParam("grade")int grade) {
		Grade grades = new Grade(sender, reciever, grade/2);
		System.out.println(grades);
		
		//사용자당 한번만 별점 매기기 가능
		int check = gradeService.checkGrade(grades);
		System.out.println(check);
		
		if(check < 1) { 
			int result = gradeService.sendGrade(grades);
			
			try {
		        response.getWriter().print(result); //메세지성공
		    } catch (IOException e) {
		        e.printStackTrace();
		    } 
		}else {
			try {
		        response.getWriter().print("0"); //메세지실패
		    } catch (IOException e) {
		        e.printStackTrace();
		    } 
		}
	}
}
