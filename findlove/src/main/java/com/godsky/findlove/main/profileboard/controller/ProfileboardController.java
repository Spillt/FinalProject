package com.godsky.findlove.main.profileboard.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.profileboard.model.service.ProfileboardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProfileboardController {
	public ProfileboardController() {}
	
	@Resource(name="profileboardService")
	private ProfileboardService profileboardService;
	
	//해당 페이지용 프로필 페이지 이동
	@RequestMapping(value = "/profileboard/profileList.do")
	public ModelAndView openProfileList(Map<String, Object> commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("main/profileboard/profileboardList");
		
		List<Map<String,Object>> list = profileboardService.selectProfileList(commandMap);
    	mv.addObject("list", list);
    	
		return mv;		
	}
	
	//프로필 상세 페이지 이동
	@RequestMapping(value = "detail.do")
	public String selectProfile() {
		return null;
	}

}
