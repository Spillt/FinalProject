package com.godsky.findlove.main.profileboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.profileboard.model.service.ProfileboardService;
import com.godsky.findlove.main.profileboard.model.vo.ProfilePager;
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
	@RequestMapping(value = "/openProfileList.do")
	public ModelAndView openProfileList(@RequestParam(defaultValue="all") String searchOption,
										@RequestParam(defaultValue="") String keyword,
            							@RequestParam(defaultValue="1") int curPage) throws Exception{
		
		int count = profileboardService.countProfileList(searchOption, keyword);
		
		ProfilePager profilePager = new ProfilePager(count, curPage);
	    int start = profilePager.getPageBegin();
	    int end = profilePager.getPageEnd();
		
		List<Profileboard> list = profileboardService.selectProfileList(start, end, searchOption, keyword);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("profilePager", profilePager);
	
	    System.out.println(list);
	    System.out.println(count);
	    
		ModelAndView mv = new ModelAndView("main/profileboard/profileboardList");
		mv.addObject("map", map);
		
		
		return mv;		
	}
	
	//프로필 상세 페이지 이동
	@RequestMapping(value = "/openProfileDetail.do", method = RequestMethod.GET)
	public ModelAndView openBoardDetail(@RequestParam String user_nicknm) throws Exception {
		Profileboard profile = profileboardService.selectProfileDetail(user_nicknm);
		List<String> profileImg = profileboardService.selectProfileImage(user_nicknm);
		
		ModelAndView mv = new ModelAndView("main/profileboard/profileboardDetail");
		mv.addObject("profile", profile);
		mv.addObject("profileImg", profileImg);
		System.out.println(profile);
		System.out.println(profileImg);
		
		return mv;
	}

}
