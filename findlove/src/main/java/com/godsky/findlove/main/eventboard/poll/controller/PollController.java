package com.godsky.findlove.main.eventboard.poll.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.eventboard.poll.model.service.PollService;
import com.godsky.findlove.main.eventboard.poll.model.vo.Poll;

@Controller
public class PollController {
	
	@Autowired
	private PollService pollService;
	
	public PollController() {}
	
	//  목록 전체 보기
	@RequestMapping(value="polllist.do")
	public ModelAndView pollList(Model model) {
		
		 List<Poll> list = pollService.listAll();
	      ModelAndView mv = new ModelAndView();
	      mv.setViewName("main/eventboard/poll/polllist");
	      mv.addObject("list", list);
	      
	      return mv;
	}
	//  상세 보기
		@RequestMapping(value="polldetail.do", method= {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView pollDetail(@RequestParam int pollNo) {
			
			// 모델(데이터)+뷰(화면)를 함께 전달하는 객체
	        ModelAndView mav = new ModelAndView();
	        // 뷰의 이름
	        mav.setViewName("main/eventboard/poll/polldetail");
	        // 뷰에 전달할 데이터
	        mav.addObject("poll", pollService.polldetail(pollNo));
	        return mav;
		}
		
	//  결과보기	
		@RequestMapping(value="pollresult.do", method= {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView pollResult(@RequestParam int pollNo) {
			
			// 모델(데이터)+뷰(화면)를 함께 전달하는 객체
	        ModelAndView mav = new ModelAndView();
	        // 뷰의 이름
	        mav.setViewName("main/eventboard/poll/pollresult");
	        // 뷰에 전달할 데이터
	        mav.addObject("poll", pollService.polldetail(pollNo));
	        return mav;
		}	

}
