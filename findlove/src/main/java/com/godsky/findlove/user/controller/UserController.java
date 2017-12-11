package com.godsky.findlove.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.godsky.findlove.user.model.service.UserService;
import com.godsky.findlove.user.model.vo.User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	public UserController(){}
	
	//로그인
	@RequestMapping(value = "login.do")
	public String loginMethod(User user, HttpSession session){
		session.setAttribute("user", userService.loginCheck(user));
		return "home";		
	}
	
	//로그아웃
	@RequestMapping(value = "logout.do")
	public String logoutMethod(){
		return "home";
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
