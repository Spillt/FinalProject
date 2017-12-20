package com.godsky.findlove.main.matchboard.qna.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.matchboard.qna.model.service.MatchQnAService;
import com.godsky.findlove.main.matchboard.qna.model.vo.MatchQnA;
@Controller
public class MatchQnAController {
	@Autowired
	private MatchQnAService matchQnAService;
	
	public MatchQnAController(){}
	
	
	
	
	
	
	
	
	@RequestMapping(value="selectuserlist.do", method=RequestMethod.GET)
	public ModelAndView selectUserList(@RequestParam("userId") String userId,HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		System.out.println("유저 아이디 : " + userId);
		//Profile profile = (Profile)matchQnAService.selectUserProfile(userId);
		String myGender = (String)matchQnAService.selectUserGender(userId);
		System.out.println("성별 : " + myGender);
		
		//MatchUser muser = (MatchUser)matchQnAService.selectUser(profile);
		ArrayList<String> matchusers = (ArrayList<String>)matchQnAService.selectUser3(myGender);
		for(int i = 0; i< matchusers.size();i++){
			System.out.println(matchusers.get(i));
		}
		/*if(user!= null){
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
		}*/
		mv.setViewName("matchboard/qna/matchMain");
		return mv;
	}
	
	@RequestMapping(value="insertmatchqna.do", method=RequestMethod.GET)
	public ModelAndView insertMatchQnA(MatchQnA QnA){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("matchboard/qna/matchInsertView");
		return mv;
	}
	
	@RequestMapping(value="updatematchqna.do", method=RequestMethod.POST)
	public MatchQnA updateMatchQnA(MatchQnA QnA){
		return null;
	}
	
	@RequestMapping(value="deletmatchqna.do", method=RequestMethod.POST)
	public MatchQnA deletMatchQnA(MatchQnA QnA){
		return null;
	}
	
	@RequestMapping(value="selectmatchqna.do", method=RequestMethod.GET)
	public ModelAndView selectMatchQnA(MatchQnA QnA){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("matchboard/qna/matchQnAView");
		return mv;
	}
	
}
