package com.godsky.findlove.main.eventboard.poll.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.godsky.findlove.main.eventboard.poll.model.service.PollService;
import com.godsky.findlove.main.eventboard.poll.model.vo.Poll;

@Controller
public class PollController {
	
	@Autowired
	private PollService pollService;
	
	public PollController() {}
	
	// 일대일 문의 목록 전체 보기
	@RequestMapping(value="polllist.do")
	public String pollList(Model model) {
		return "main/eventboard/poll/polllist";
	}
	// 일대일 문의 상세 보기
		@RequestMapping(value="polldetail.do")
		public String pollDetail(Model model) {
			return "main/eventboard/poll/polldetail";
		}
		
	// 일대일 문의 답변 대기글 보기
	@RequestMapping(value="pollwaitlist.do")
	public String pollWaitList(Model model) {
		model.addAttribute("list", pollService.getPollWaitList());
		return null;
	}
	
	
	
	// 일대일 문의 답변하기
	@RequestMapping(value="pollanswer.do")
	public String pollAnswer(Poll poll, Model model) {
		int result = pollService.pollAnswer(poll);
		return null;
	}

}
