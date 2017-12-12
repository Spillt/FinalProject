package com.godsky.findlove.main.profileboard.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.profileboard.model.service.ReportService;
import com.godsky.findlove.main.profileboard.model.vo.Message;
import com.godsky.findlove.main.profileboard.model.vo.Report;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ReportController {

	public ReportController() {}
	
	@Resource(name="reportService")
	private ReportService reportService;
	
	/*ajax로 실행될 메소드*/
	@RequestMapping("/report/sendReport.do")
	public void sendReport(ModelAndView mv, HttpServletResponse response, @RequestParam("sender")String sender, @RequestParam("reciever")String reciever, @RequestParam("message")String content) {
		Report report = new Report(sender, reciever, content);
		System.out.println(report);
		int result = reportService.sendReport(report);
		
		try {
	        response.getWriter().print(result);
	    } catch (IOException e) {
	        e.printStackTrace();
	    } 
	}
}
