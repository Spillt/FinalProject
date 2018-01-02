package com.godsky.findlove.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.godsky.findlove.common.model.vo.Profile;
import com.godsky.findlove.user.model.dao.UserDao;

import com.godsky.findlove.user.model.service.UserService;
import com.godsky.findlove.user.model.vo.Image;
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
	private Profile profile;

	public UserController(){}
	
	//로그인 
	@RequestMapping(value = "logincheck.do")
	public ModelAndView loginCheck(@ModelAttribute User vo, HttpSession session){
		boolean result = userService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();		
		if(result == true){			
			mav.setViewName("home");
			mav.addObject("msg", "success");
			session.setAttribute("user_nm", vo.getUser_nm());
			session.setAttribute("user_nicknm", vo.getUser_nicknm());
			session.setAttribute("konpeito_cnt", vo.getKonpeito_cnt());
			session.setAttribute("point_cnt", vo.getPoint_cnt());			
					
			System.out.println("세션추가됨");
			
		}else{			
			mav.setViewName("home");	
			mav.addObject("msg", "failure");
			
		}
		return mav;
		
		
	}
	
	/*@RequestMapping(value = "logincheck.do", method=RequestMethod.POST)
	public ModelAndView loginCheck(User vo, HttpSession session, HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		
		User loginUser = userService.findByUserIdAndPwd(vo.getUser_id(),vo.getUser_pwd());
		
		if(loginUser != null){
			session.setAttribute(loginUser);
		}
		return mav;
		
		
	}*/
	
	
	//로그아웃
	@RequestMapping(value = "logout.do")
	public ModelAndView logout(HttpSession session){
		userService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		System.out.println("세션종료됨");
	
		return mav;
		
	}
	
	//세션 삭제
	@RequestMapping(value = "deleteSession.do")
	public void deleteSession(HttpSession session){
			userService.deleteSession(session.getId());
			System.out.println("UserController deleteSession.do 실행");
	}
	
	//세션 체크
	@RequestMapping(value = "sessionCheck.do")
	public void sessionCheck(@RequestParam("user_id")String user_id,HttpSession session,HttpServletResponse response){
		/*if(userId !=null){
			if(userService.checkSession(session.getId()) == 0){				
				userService.insertSession(session.getId(), userId);
			}
		}*/
		
		int check = 0;
	      if(user_id !=null){
	    	  try {
	    		  if(userService.checkSession(session.getId()) == 0){				
	  				userService.insertSession(session.getId(), user_id);
	  			}
	    		  response.getWriter().print(user_id);
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
	
	//로그인 체크
	@RequestMapping(value = "loginCheck.do")
	public void loginCheck(HttpSession session, HttpServletResponse response){
		try {

		      Thread.sleep(100);

		} catch (InterruptedException e) { }				

		
		int count = userService.loginCount();
		
		if(count != 0){
			ArrayList<String> userList = (ArrayList<String>)userService.userList();
			String count1 = String.valueOf(count);
			userList.add(count1);

			// list 나 map 을 json 배열로 내보내는 컨트롤러
				//json 객체 하나만 내보낼 수 있음
				//json 배열을 json 객체에 저장함
				//내보낼 json 객체 선언
				JSONObject job = new JSONObject();
				//list 옮겨담을 json 배열 선언
				JSONArray jarr = new JSONArray();
				
				for(String List : userList){
					// user 객체 한 개를 저장할 json 객체 선언
					JSONObject j = new JSONObject();
					j.put("list", List);
					
					
					jarr.add(j);
				}
				
				job.put("list", jarr); 
				
				try {
					response.getWriter().print(job);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}else{

			
			try {
				JSONObject job = null;
				response.getWriter().print(job);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	//중복체크
	@RequestMapping(value = "idDupliCheck.do", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int idDuplicatedCheck(User user, Model model) {
		return userService.idDuplicatedCheck(user);
		
			
	}
		
	//회원가입 페이지 이동
	@RequestMapping(value = "signup.do", method=RequestMethod.GET)
	public String signUpView(){
		return "user/signup";		
	}
	
	
	//회원가입 처리
	@RequestMapping(value = "signup.do", method=RequestMethod.POST)
	public String signUp(User user) throws Exception{
		System.out.println("회원가입처리 controller : " +user);
		userService.signUp(user);
		return "home";
	}

	
	//내정보 보기
	@RequestMapping(value = "myinfo.do")
	public ModelAndView myInfoView(@RequestParam("user_id") String user_id){
		ModelAndView mav = new ModelAndView();
        // 뷰의 이름
        mav.setViewName("user/myinfo");
        // 뷰에 전달할 데이터
        User user =userService.myInfo(user_id);
        System.out.println("내정보 보기 : " + user);
        mav.addObject("user", userService.myInfo(user_id));
		return mav ;
	}

	//내정보 수정 페이지 매핑
	@RequestMapping(value = "myinfosetview.do")
	public ModelAndView myInfoSetView(@RequestParam("user_id") String user_id){
		ModelAndView mav = new ModelAndView();
		//뷰의 이름
		mav.setViewName("user/myinfoset");
		//뷰에 전달할 데이터
		User user = userService.myInfo(user_id);
		mav.addObject("user", user);
		return mav;
		
	}
	
	//내정보 수정 처리
	@RequestMapping(value="myinfoset.do")
	public ModelAndView myInfoSet(@ModelAttribute("user") User user) {
		userService.myInfoSet(user);
		return myInfoView(user.getUser_id());
		
	}
	
	
	//내 프로필 보기
	@RequestMapping(value = "myprofile.do")
	public ModelAndView myProfileView(@RequestParam("user_id") String user_id){
		ModelAndView mav= new ModelAndView();
		System.out.println("내 프로필 보기 user_id : " + user_id);
		//뷰 이름
		mav.setViewName("user/myprofile");
		// 전달할 데이터		
		Profile profile = userService.myProfile(user_id);
		User user = userService.myInfo(user_id);
		System.out.println("내 프로필 보기 profile : " + profile);
		mav.addObject("user", userService.myInfo(user_id));
		mav.addObject("profile", userService.myProfile(user_id));
		
		return mav;
	}
	
	//내 프로필 수정 페이지 매핑
	@RequestMapping(value = "myprofilesetview.do")
	public ModelAndView myProfileSetView(@RequestParam("user_id") String user_id){
		ModelAndView mav = new ModelAndView();		
		System.out.println("내 프로필 수정 user_id : " + user_id);
		//뷰이름
		mav.setViewName("user/myprofileset");
		//전달할 데이터
		
		User user = userService.myInfo(user_id);
		Profile profile = userService.myProfile(user_id);
		
		System.out.println("내 프로필 수정 페이지 매핑 : user : " + user);
		System.out.println("내 프로필 수정 페이지 매핑 : profile : " + profile);		
					
		mav.addObject("user", userService.myInfo(user_id));
		mav.addObject("profile", profile);
		return mav;		
	}
	
	//내 프로필 수정 처리
	@RequestMapping(value = "myprofileset.do", method=RequestMethod.POST)
	public ModelAndView myProfileSet(@ModelAttribute("profile") Profile profile){
		
		userService.myProfileSet(profile);
		return myProfileView(profile.getUser_id());
	}
	
	//이상형 프로필 보기
	@RequestMapping(value = "idealprofile.do")
	public ModelAndView idealProfileView(@RequestParam("user_id") String user_id){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/idealprofile");
		
		Profile profile = userService.idealProfile(user_id);
		User user = userService.myInfo(user_id);
		
		System.out.println("이성 프로필 보기 user_id : " + user_id);
		System.out.println("이성 프로필 보기 profile : " + profile);
		
		mav.addObject("user", userService.myInfo(user_id));
		mav.addObject("profile",userService.idealProfile(user_id));
		
		return mav;
		
	}
	
	//이상형 프로필 수정 매핑
	@RequestMapping(value = "idealprofilesetview.do")
	public ModelAndView idealProfileSetView(@RequestParam("user_id") String user_id){
		ModelAndView mav = new ModelAndView();
		System.out.println("이상형 프로필 수정 컨트롤러 user_id : " + user_id);
		mav.setViewName("user/idealprofile");
		User user = userService.myInfo(user_id);
		Profile profile = userService.idealProfile(user_id);
		mav.addObject("user", userService.myInfo(user_id));
		mav.addObject("profile",profile);
		
		return mav; 
	}
	
	//이상형 프로필 수정 처리
	@RequestMapping(value = "idealprofileset.do", method=RequestMethod.POST)
	public ModelAndView idealProfielSet(@ModelAttribute("profile") Profile profile){
		userService.idealProfileSet(profile);
		return idealProfileView(profile.getUser_id());
	}
	
	//회원탈퇴
	@RequestMapping(value = "removeuser.do")
	public ModelAndView removeUser(@RequestParam("user_id") String user_id, HttpSession session){
		userService.removeUserById(user_id);
		System.out.println("회원탈퇴 컨트롤러 user_id : " +user_id);			
		ModelAndView mv = null;			
			mv = new ModelAndView("home");
			//세션 소멸
			session.invalidate();
		return mv;
		
	}
	
	//아이디, 비밀번호 페이지 이동
	@RequestMapping(value = "findidpwd.do")
	public String findIdPwd(){
		return "user/findidpwd";		
	}
	
	//스토어 이동
	@RequestMapping(value = "store.do")
	public ModelAndView store(String user_id){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/store");	
		/*User user = userService.storeUser(user_id);
		System.out.println("스토어 이동 컨트롤러 user_id :" + user_id);
		mav.addObject("user", userService.storeUser(user_id));*/
		return mav;
	}
	
	


	
}
