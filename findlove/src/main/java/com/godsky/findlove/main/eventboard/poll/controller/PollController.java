package com.godsky.findlove.main.eventboard.poll.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
		@RequestMapping(value="polldetail.do")
		public String pollDetail(Model model) {
			return "main/eventboard/poll/polldetail";
		}
		
	//  결과보기
	@RequestMapping(value="pollresult.do")
	public String pollResult(Model model) {
		return "main/eventboard/poll/pollresult";
	}
		
	// 답변하기
	@RequestMapping(value="pollanswer.do")
	public String pollAnswer(Poll poll, Model model) {
		int result = pollService.pollAnswer(poll);
		return null;
	}

}
