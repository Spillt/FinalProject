package com.godsky.findlove.user.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.user.model.service.UserService;
import com.godsky.findlove.user.model.vo.User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserController {
	
	//로깅 변수
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	public UserController(){}
	
	//로그인 
	@RequestMapping(value = "logincheck.do")
	public ModelAndView loginCheck(@ModelAttribute User vo, HttpSession session){
		boolean result = userService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if(result == true){
			mav.setViewName("home");
			mav.addObject("msg", "success");
			System.out.println("세션추가됨");
		}else{
			mav.setViewName("home");
			mav.addObject("msg", "failure");			
		}
		return mav;
		
		
	}
	
	//로그아웃
	@RequestMapping(value = "logout.do")
	public ModelAndView logout(HttpSession session){
		userService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home.do");
		mav.addObject("msg", "logout");
		return mav;
		
	}
	//회원가입 페이지
	@RequestMapping(value = "signupview.do")
	public String signUpView(){
		return "user/signup";		
	}
	
	//회원생성
	@RequestMapping(value = "signup.do")
	public String signUp(){
		return "signup";		
	}
	
	//내정보	
	@RequestMapping(value = "myinfo.do")
	public String selectMyInfo(){
		return "user/myinfo" ;
	}
	
	//내정보 업데이트
	@RequestMapping(value = "updateMyInfo.do")
	public String updateMyInfo(){
		return null;
		
	}
	
	//회원삭제
	@RequestMapping(value = "dropUser.do")
	public String dropUser(){
		return null;
		
	}
	
	//아이디, 비밀번호 찾기
	@RequestMapping(value = "findidpwd.do")
	public String findIdPwd(){
		return "user/findidpwd";		
	}
	


	
}
