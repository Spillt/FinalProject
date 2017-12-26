package com.godsky.findlove.main.mychatboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MychatboardController2 {
	
	public MychatboardController2() {}
	
	@RequestMapping(value = "/test.do")
	public ModelAndView openSendMessageList(@RequestParam("sender_id") String sender_id) throws Exception {
		System.out.println(sender_id);
		
		ModelAndView mv = new ModelAndView("main/mychatboard/mychatboardList");
		
		return mv;
	}
}
