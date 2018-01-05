package com.godsky.findlove.main.matchboard.common.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.godsky.findlove.main.matchboard.qna.model.service.MatchQnAService;

@Controller
public class MatchMainController {
	
	@Autowired
	private MatchQnAService matchQnAService;
	
	public MatchMainController() {}
	
	@RequestMapping("matchstartview.do")
	public String matchMain(@RequestParam("userId") String userId, Model model) {
		
		int checkfl = matchQnAService.checkExistAnswer(userId);
		model.addAttribute("checkfl", checkfl);
		return "main/matchboard/matchstartview";
	}
}
