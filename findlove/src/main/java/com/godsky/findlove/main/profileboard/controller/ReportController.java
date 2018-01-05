package com.godsky.findlove.main.profileboard.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.godsky.findlove.common.model.vo.Report;
import com.godsky.findlove.main.profileboard.model.service.ReportService;;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ReportController {

	public ReportController() {}
	
	@Resource(name="reportService")
	private ReportService reportService;
	
	/*ajax로 실행될 메소드*/
	@RequestMapping(value = "/sendReport.do")
	public void sendReport(HttpServletResponse response, @RequestParam("checkedValue")String checkedValue,
			@RequestParam("sender")String sender, @RequestParam("reciever")String reciever,
			@RequestParam("content")String content){
		Report report = new Report(checkedValue, sender, reciever, content);
		System.out.println(report);
		
		//사용자당 한번만 신고하기 가능
		int check = reportService.checkReport(report);
		System.out.println(check);
		
		if(check < 1) { 
			int result = reportService.sendReport(report);
			
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

