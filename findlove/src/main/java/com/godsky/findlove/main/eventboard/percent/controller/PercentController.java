package com.godsky.findlove.main.eventboard.percent.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.eventboard.percent.model.service.PercentService;
import com.godsky.findlove.main.eventboard.percent.model.vo.Percent;
import com.godsky.findlove.main.matchboard.iwc.model.vo.IdealWorldCup;
import com.godsky.findlove.main.noticeboard.model.vo.Notice;

@Controller
public class PercentController {
	
	@Autowired
	private PercentService percentService;
	
	public PercentController() {}
	
	
	@RequestMapping(value="percent.do", method = RequestMethod.GET)
	public ModelAndView percent(@RequestParam("userId") String userId, Locale locale, Model model) {
		 /*String user = (String) percentService.selectUserName(userId);*/
		 ArrayList<Percent> list = (ArrayList<Percent>) percentService.list(userId);
	        // ModelAndView - 모델과 뷰
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("/main/eventboard/percent/percent"); // 뷰를 percent.jsp로 설정 
	        /*System.out.println(user);*/
	        System.out.println(list);
	        mv.addObject("userId", userId);
	        mv.addObject("list", list);
	        return mv; // percent.jsp로 List가 전달
	}

}
