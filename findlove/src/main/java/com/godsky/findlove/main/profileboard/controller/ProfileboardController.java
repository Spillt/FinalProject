package com.godsky.findlove.main.profileboard.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.profileboard.model.service.ProfileboardService;
import com.godsky.findlove.main.profileboard.model.vo.Profileboard;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProfileboardController {
	
	public ProfileboardController() {}
	
	@Resource(name="profileboardService")
	private ProfileboardService profileboardService;
	
	//해당 페이지용 프로필 페이지 이동
	@RequestMapping(value = "/profileboard/openProfileList.do")
	public ModelAndView openProfileList() throws Exception{
		List<Profileboard> list = profileboardService.selectProfileList();
		
		ModelAndView mv = new ModelAndView("main/profileboard/profileboardList");
		mv.addObject("list", list);
		System.out.println(list);
		
		return mv;		
	}
	
	//프로필 상세 페이지 이동
	@RequestMapping(value = "/profileboard/openProfileDetail.do", method = RequestMethod.GET)
	public ModelAndView openBoardDetail(@RequestParam String user_nicknm) throws Exception {
		Profileboard list = profileboardService.selectProfileDetail(user_nicknm);
		
		ModelAndView mv = new ModelAndView("main/profileboard/profileboardDetail");
		mv.addObject("list", list);
		System.out.println(list);
		
		return mv;
	}

}
