package com.godsky.findlove.user.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
<<<<<<< HEAD
=======
import org.springframework.validation.BindingResult;
>>>>>>> Chanwoo

import com.godsky.findlove.user.model.service.UserService;
import com.godsky.findlove.user.model.vo.User;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/user/*")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	public UserController(){}
	
	//로그인 화면
	@RequestMapping(value = "login.do")
	public String loginMethod(){
		return "user/login";		
	}
	
	//로그인 처리
	@RequestMapping(value = "loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute User vo, HttpSession session){
		boolean result = userService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if(result == true){
			//로그인 성공
			mav.setViewName("home");
			mav.addObject("msg","success");
		}else{
<<<<<<< HEAD
=======
			//로그인 실패
>>>>>>> Chanwoo
			mav.setViewName("user/login");
			mav.addObject("msg", "fail");
		}
		return mav;
	}
	
	//로그아웃
	@RequestMapping(value = "logout.do")
	public ModelAndView logout(HttpSession session){
		userService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/login");
		mav.addObject("msg", "logout");
		return mav;
	}
	
	//회원가입
	@RequestMapping(value = "signUp.do", method=RequestMethod.GET)
<<<<<<< HEAD
	public String singUp(){
		return "user/signUp";		
	}
=======
	public String signUp(){
		return "user/signUp";		
	}	
	
>>>>>>> Chanwoo
	
	//내정보	
	@RequestMapping(value = "myInfo.do")
	public String selectMyInfo(){
		return null ;
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
	
	//아이디찾기
	@RequestMapping(value = "findId.do")
	public String findId(){
		return null;		
	}
	
	//비밀번호 찾기
	@RequestMapping(value = "findPwd.do")
	public String finePwd(){
		return null;
	}
	
		
	

	
}
