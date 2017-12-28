package com.godsky.findlove.main.matchboard.qna.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.godsky.findlove.main.matchboard.qna.model.vo.MatchingQuestion;
@Controller
public class MatchQnAController {
	@Autowired
	private MatchQnAService matchQnAService;
	
	public MatchQnAController(){}
	
	
	
	
	
	
	
	
	@RequestMapping(value="selectuserlist.do")
	public ModelAndView selectUserList(@RequestParam("userId") String userId,HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		System.out.println("유저 아이디 : " + userId);		
		String myGender = (String)matchQnAService.selectUserGender(userId);
		System.out.println("성별 : " + myGender);
		
		ArrayList<String> matchUsers = (ArrayList<String>)matchQnAService.selectUser3(myGender);
		
		
		
		MatchUser muser = (MatchUser)matchQnAService.selectMyQnA(userId);
		System.out.println(muser);
		MatchUser newUser = null;
		if(matchUsers.size() >= 3){
			newUser = new MatchUser(userId,null,matchUsers.get(0),matchUsers.get(1),matchUsers.get(2),0);
		}else{
			newUser = new MatchUser(userId,null,matchUsers.get(0),matchUsers.get(1),null,0);
		}
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
			ArrayList<MatchQnA> myQnA = (ArrayList<MatchQnA>)matchQnAService.selectMyQuestion(userId);
			mv.addObject("list", list);
			mv.addObject("myQnA", myQnA);
			System.out.println("오늘 매칭했는가?" + todayMatchUser.getMatching());
			mv.addObject("today_matching", todayMatchUser.getMatching());//오늘 매칭했는가 확인
			mv.setViewName("matchboard/qna/matchMain");
			
		}else{
			mv.setViewName("matchboard/qna/matchError");
		}
		
		return mv;
	}
	
	@RequestMapping(value="listMatchqna.do")
	public ModelAndView insertMatchQnA(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		ArrayList<MatchingQuestion> mQnA = (ArrayList<MatchingQuestion>)matchQnAService.selectQuestion();
		
		mv.addObject("list", mQnA);
		mv.setViewName("matchboard/qna/matchInsertView");
		return mv;
	}
	@RequestMapping(value="insertMatchqna.do")
	public ModelAndView insertMatchQnA(@RequestParam("check") ArrayList check,@RequestParam("userId") String userId, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		System.out.println(userId);
		for(int i = 0;i < check.size();i++){
			String[] txtArr = check.get(i).toString().split("/") ;
			
			System.out.println("질문 : " + txtArr[0]);
			System.out.println("답변 : " + txtArr[1]);
			 int Qno = Integer.parseInt(txtArr[0]);
			MatchQnA myQnA =  new MatchQnA(userId,Qno,txtArr[1]);
			int insertMyQnA = (int)matchQnAService.insertMyQnA(myQnA);
			
		}
		
		mv = selectUserList(userId,request);
		return mv;
	}
	
	@RequestMapping(value="updateMatchqna.do")
	public ModelAndView updateMatchQnA(@RequestParam("check") ArrayList check,@RequestParam("userId") String userId, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		System.out.println(userId);
		for(int i = 0;i < check.size();i++){
			String[] txtArr = check.get(i).toString().split("/") ;
			
			System.out.println("질문 : " + txtArr[0]);
			System.out.println("답변 : " + txtArr[1]);
			 int Qno = Integer.parseInt(txtArr[0]);
			MatchQnA myQnA =  new MatchQnA(userId,Qno,txtArr[1]);
			int updateMyQnA = (int)matchQnAService.updateMyQnA(myQnA);
			
		}
		
		mv = selectUserList(userId,request);
		return mv;
	}
	
	@RequestMapping(value="myMatchqna.do")
	public ModelAndView myMatchQnA(@RequestParam("userId") String userId, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		ArrayList<MatchingQuestion> mQnA = (ArrayList<MatchingQuestion>)matchQnAService.selectQuestion();
		ArrayList<MatchQnA> myQnA = (ArrayList<MatchQnA>)matchQnAService.selectMyQuestion(userId);
		mv.addObject("list", mQnA);
		mv.addObject("myQnA", myQnA);
		for(int i=0; i<myQnA.size();i++){
			System.out.println(myQnA.get(i).toString());
		}
		mv.setViewName("matchboard/qna/myMatchQnAView");
		return mv;
	}
	
	@RequestMapping(value="deletmatchqna.do")
	public MatchQnA deletMatchQnA(MatchQnA QnA){
		return null;
	}
	
	@RequestMapping(value="selectmatchqna.do")
	public ModelAndView selectMatchQnA(@RequestParam("matchingUserId") String matchingUserId,HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		ArrayList<MatchQnA> matchingUserQnA = (ArrayList<MatchQnA>)matchQnAService.selectMyQuestion(matchingUserId);
		
		
		ArrayList<MatchingQuestion> matchQnA = (ArrayList<MatchingQuestion>)matchQnAService.selectQuestion3();
		for(int i=0;i<matchQnA.size();i++){
			System.out.println(matchQnA);
		}
		int question_num = 1;
		mv.addObject("matchingUserId",matchingUserId);
		//mv.addObject("matchQnA", matchQnA);
		mv.addObject("matchingUserQnA", matchingUserQnA);
		mv.addObject("question_num", question_num);
		mv.addObject("matchQnA1", matchQnA.get(0));
		mv.addObject("matchQnA2", matchQnA.get(1));
		mv.addObject("matchQnA3", matchQnA.get(2));
		mv.setViewName("matchboard/qna/matchQnAView");
		return mv;
	}

	@RequestMapping("selectMatchUserQnA.do")
	public void selectMatchUserQnA(@RequestParam("matchingUserId")String matchingUserId, @RequestParam("questionNo")int questionNo, @RequestParam("answerNo")String answerNo, HttpServletResponse response) {
		
		  System.out.println(questionNo);
	      System.out.println(answerNo);
	      System.out.println(matchingUserId);
	      Integer.valueOf(questionNo);
	      MatchQnA matchingUserQnA = new MatchQnA(matchingUserId,questionNo,answerNo);
	      System.out.println("matchingUserQnA = " + matchingUserQnA);
	      MatchQnA result = (MatchQnA)matchQnAService.checkMatchingUserQnA(matchingUserQnA);
	      System.out.println("result = " + result);
	      int check = 0;
	      if(result !=null){
	    	  try {
	    		  System.out.println(result);
	    		  response.getWriter().print(result);
	    	  } catch (IOException e) {
	    		  e.printStackTrace();
	    	  }
	      }else{
	    	  try {
	    		  System.out.println(check);
	    		  response.getWriter().print(check);
	    	  } catch (IOException e) {
	    		  e.printStackTrace();
	    	  }
	      }
	   }
	@RequestMapping(value="todayMatchCheck.do")
	public ModelAndView todayMatchCheck(@RequestParam("userId") String userId,@RequestParam("result") int result,HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		System.out.println("확인 : " + userId);
		System.out.println("확인2 : " + result);
		
		int today = 0;
		today = matchQnAService.todayMatchCheck(userId);
		System.out.println("today : " + today);
		mv = selectUserList(userId,request);
		return mv;
	}
}
