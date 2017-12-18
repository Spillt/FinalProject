package com.godsky.findlove.main.matchboard.qna.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.matchboard.qna.service.MatchQnAService;
import com.godsky.findlove.main.matchboard.qna.vo.MatchQnA;
import com.godsky.findlove.main.matchboard.qna.vo.MatchUser;
import com.godsky.findlove.user.model.vo.Profile;
import com.godsky.findlove.user.model.vo.User;
@Controller
public class MatchQnAController {
	@Autowired
	private MatchQnAService matchQnAService;
	
	public MatchQnAController(){}
	
	
	
	
	
	
	
	
	@RequestMapping(value="selectuserlist.do", method=RequestMethod.GET)
	public ModelAndView selectUserList(User user,Profile profile,HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		MatchUser muser = (MatchUser)matchQnAService.selectUser(profile);
		
		if(user!= null){
			if(profile != null){
				if(muser != null){
					int result = matchQnAService.insertMatchUser(user);
				}else{
					int result = matchQnAService.updateMatchUser(user);
				}
				
				ArrayList<Profile> list = (ArrayList<Profile>)matchQnAService.select3(muser);
				mv.setViewName("matchboard/qna/matchMain");
				
			}else{
				mv.setViewName("matchboard/qna/error");//프로필 갱신필요
			}
		}else{
			
			mv.setViewName("matchboard/qna/error");//로그인필요
		}
		return mv;
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
