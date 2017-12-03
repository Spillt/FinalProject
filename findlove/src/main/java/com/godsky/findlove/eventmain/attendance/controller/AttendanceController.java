package com.godsky.findlove.eventmain.attendance.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.godsky.findlove.eventmain.attendance.model.service.AttendanceService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService attendanceService;
	
	public AttendanceController(){}
	
	
	@RequestMapping(value = "userId.do")
	public String userId(){
		return null;
		
	}
	
	
	@RequestMapping(value = "findId.do")
	public String findId(){
		return null;		
	}
	

	@RequestMapping(value = "findPwd.do")
	public String finePwd(){
		return null;
	}
	
		
	

	
}
