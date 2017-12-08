package com.godsky.findlove.eventmain.poll.controller;

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

import com.godsky.findlove.eventmain.poll.model.service.PollService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PollController {
	
	@Autowired
	private PollService pollService;
	
	public PollController(){}
	
	
	@RequestMapping(value = "pollDetail.do")
	public String pollDdetail(){
		return null;		
	}
	
		
	@RequestMapping(value = "pollList.do")
	public String pollList(){
		return null ;
	}
	
	
	@RequestMapping(value = "updatePoll.do")
	public String updateMyInfo(){
		return null;
	}
	
	
	
	
		
	

	
}
