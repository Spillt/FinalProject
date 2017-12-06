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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	//회원생성
	@RequestMapping(value = "signup.do")
	public String singUp(){
		return null;		
	}
	
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
