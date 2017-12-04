package com.godsky.findlove.main.matchboard.score.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.godsky.findlove.main.matchboard.score.service.MatchScoreService;
import com.godsky.findlove.main.matchboard.score.vo.MatchScore;
import com.godsky.findlove.user.model.vo.User;
@Controller
public class MatchScoreController {
	@Autowired
	private MatchScoreService matchScoreService;
	
	public MatchScoreController(){}
	
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public MatchScore insertScore(MatchScore score){
		return null;
	}
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public MatchScore selectMatching(MatchScore score){
		return null;
	}
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public MatchScore allSelect(User user){
		return null;
	}
	
}
