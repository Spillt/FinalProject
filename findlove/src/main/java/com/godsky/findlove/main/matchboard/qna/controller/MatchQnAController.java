package com.godsky.findlove.main.matchboard.qna.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.matchboard.qna.model.service.MatchQnAService;
import com.godsky.findlove.main.matchboard.qna.model.vo.MatchQnA;
import com.godsky.findlove.main.matchboard.qna.model.vo.MatchUser;
import com.godsky.findlove.main.matchboard.qna.model.vo.MatchUserProfile;
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
		ArrayList<String> matchUsers = (ArrayList<String>)matchQnAService.selectUser3(myGender);
		
		
		
		MatchUser muser = (MatchUser)matchQnAService.selectMyQnA(userId);
		System.out.println(muser);
		
		MatchUser newUser = new MatchUser(userId,null,matchUsers.get(0),matchUsers.get(1),matchUsers.get(2));
		
		String matchDate = (String)matchQnAService.selectDate(userId);
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyMMdd", Locale.KOREA );
		Date currentTime = new Date ();
		String mTime = mSimpleDateFormat.format ( currentTime );
		
		
		
		int result = 0;
		
		if(userId !=null){					//로그인 되있을경우
			if(muser == null){				//매칭 유무
				result = matchQnAService.insertMatchUser(newUser); //매칭을 한번도 안한경우
				
			}else{			
				if(!(matchDate.equals(mTime)))
					result = matchQnAService.updateMatchUser(newUser); //매칭을 했지만 오늘 안한경우 update
			
			}
			MatchUser todayMatchUser = (MatchUser)matchQnAService.selectMyQnA(userId);
			ArrayList<MatchUserProfile> list = (ArrayList<MatchUserProfile>)matchQnAService.selectMatchUserProfileList(todayMatchUser);
			
			System.out.println(todayMatchUser);
			for(int i = 0; i< list.size();i++){
				System.out.println(list.get(i));
			}
			
			mv.addObject("list", list);
			mv.setViewName("matchboard/qna/matchMain");
			
		}else{
			mv.setViewName("matchboard/qna/matchError");
		}
		
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
