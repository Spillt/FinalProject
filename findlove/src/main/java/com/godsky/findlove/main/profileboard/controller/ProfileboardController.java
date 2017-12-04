package com.godsky.findlove.main.profileboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.godsky.findlove.main.profileboard.model.service.ProfileboardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProfileboardController {
	
	@Autowired
	private ProfileboardService profileboardService;
	
	public ProfileboardController() {}
	
	//해당 페이지용 프로필 페이지 이동
	@RequestMapping(value = "profilelist.do")
	public String selectList(){
		return null;		
	}
	
	//프로필 상세 페이지 이동
	@RequestMapping(value = "profiledetail.do")
	public String selectProfile() {
		return null;
	}

}
