package com.godsky.findlove.user.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("Welcome home()! ");				
		return "home";
	}
	
	@RequestMapping("testDI.do")
	public String testDI(Model model){
		logger.info("Welcome testDI()! ");
		return "test/testDI";
	}
	
	@RequestMapping("testAOP.do")
	public String testAOP(Model model){
		logger.info("Welcome testAOP()! ");
		return "test/testAOP";
	}
}
