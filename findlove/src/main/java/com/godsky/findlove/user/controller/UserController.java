package com.godsky.findlove.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.user.model.dao.UserDao;
import com.godsky.findlove.user.model.service.UserService;
import com.godsky.findlove.user.model.vo.User;

import oracle.jdbc.driver.ClassRef.Locale;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserController {
	
	//로깅 변수
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	private UserDao userDao;
	
	public UserController(){}
	
	//로그인 
	@RequestMapping(value = "logincheck.do")
	public ModelAndView loginCheck(@ModelAttribute User vo, HttpSession session){
		boolean result = userService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if(result == true){
			mav.setViewName("home");
			System.out.println("세션추가됨");
		}else{
			mav.setViewName("home");
			mav.addObject("msg", "failure");			
		}
		return mav;
		
		
	}
	
	/*public void loginCheck(Locale locale, Model model, User vo, 
			HttpSession session, HttpServletResponse response) throws IOException{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(vo.getUserId() != null && !vo.getUserId().equals("")
				&& vo.getUserPwd() != null && !vo.getUserPwd().equals("")){
			
			if(userDao.loginCheck(vo)){
				session.setAttribute("login", 0);//로그인 성공시 세션
				
				session.setAttribute("userId", vo.getUserId());
				
				out.println("<script>location.href='/'</script>");
				out.flush();
				out.close();
				
			}
			if(userDao.loginCheck(vo) == false){
				out.println("<script>alert('로그인 정보를 확인하세요!'); history.go(-1);</script>");
				out.flush();
				out.close();
			}
			
		}
	}*/
	
	//로그아웃
	@RequestMapping(value = "logout.do")
	public ModelAndView logout(HttpSession session){
		userService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		mav.addObject("msg", "logout");
		return mav;
		
	}
	
	//중복체크
	@RequestMapping(value = "idCheck.do")
	public int idCheck(@RequestParam String userId) {
		System.out.println(userId);
		int result = userService.idCheck(userId);
		return result;
			
	}
		
	//회원가입 페이지
	@RequestMapping(value = "signup.do", method=RequestMethod.GET)
	public String signUpView(){
		return "user/signup";		
	}
	
	
	//회원가입 처리
	@RequestMapping(value = "signup.do", method=RequestMethod.POST)
	public String signUp(User user) throws Exception{
		System.out.println(user);
		userService.insert(user);
		return "home";
	}

	
	//내정보 보기
	@RequestMapping(value = "myinfo.do")
	public String myInfoView(){
		return "user/myinfo" ;
	}
	
	//내정보 수정
	@RequestMapping(value = "myinfoset.do")
	public String myInfoSet(){
		return "user/myinfoset";
		
	}
	//내 프로필 보기
	@RequestMapping(value = "myprofile.do")
	public String myProfileView(){
		return "user/myprofile";
	}
	
	//내 프로필 수정
	@RequestMapping(value = "myprofileset.do")
	public String myProfileSet(){
		return "user/myprofileset";		
	}
	
	//이상형 프로필 보기
	@RequestMapping(value = "idealprofile.do")
	public String idealProfileView(){
		return "user/idealprofile";
		
	}
	
	//이상형 프로필 수정
	@RequestMapping(value = "idealprofileset.do")
	public String idealProfileSet(){
		return "user/idealprofileset";
	}
	
	//회원삭제
	@RequestMapping(value = "dropUser.do")
	public String dropUser(){
		return null;
		
	}
	
	//아이디, 비밀번호 페이지 이동
	@RequestMapping(value = "findidpwd.do")
	public String findIdPwd(){
		return "user/findidpwd";		
	}
	
	


	
}
