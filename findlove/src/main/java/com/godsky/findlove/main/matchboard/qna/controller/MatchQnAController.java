package com.godsky.findlove.main.matchboard.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.godsky.findlove.main.matchboard.qna.service.MatchQnAService;
import com.godsky.findlove.main.matchboard.qna.vo.MatchQnA;
import com.godsky.findlove.user.model.vo.User;
@Controller
public class MatchQnAController {
	@Autowired
	private MatchQnAService matchQnAService;
	
	public MatchQnAController(){}
	
	
	@RequestMapping(value="selectuserlist.do", method=RequestMethod.POST)
	public MatchQnA selectUserList(User User){
		return null;
	}
	
	@RequestMapping(value="insertmatchqna.do", method=RequestMethod.POST)
	public MatchQnA insertMatchQnA(MatchQnA QnA){
		return null;
	}
	
	@RequestMapping(value="updatematchqna.do", method=RequestMethod.POST)
	public MatchQnA updateMatchQnA(MatchQnA QnA){
		return null;
	}
	
	@RequestMapping(value="deletmatchqna.do", method=RequestMethod.POST)
	public MatchQnA deletMatchQnA(MatchQnA QnA){
		return null;
	}
	
	@RequestMapping(value="selectmatchqna.do", method=RequestMethod.POST)
	public MatchQnA selectMatchQnA(MatchQnA QnA){
		return null;
	}
	
}
