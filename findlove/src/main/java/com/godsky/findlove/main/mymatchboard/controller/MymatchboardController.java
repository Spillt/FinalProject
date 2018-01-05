package com.godsky.findlove.main.mymatchboard.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.mymatchboard.model.service.MymatchboardService;
import com.godsky.findlove.main.mymatchboard.model.vo.MyMessage;
import com.godsky.findlove.main.profileboard.model.vo.Check;
import com.godsky.findlove.main.profileboard.model.vo.Profileboard;
import com.godsky.findlove.user.model.service.UserService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class MymatchboardController {
	
	public MymatchboardController() {}
	
	@Resource(name="mymatchboardService")
	private MymatchboardService mymatchboardService;
	
	@Resource(name="userService")
	private UserService userService;
	
	//보낸 메세지함
	@RequestMapping(value = "/openSendMessageList.do")
	public ModelAndView openSendMessageList(@RequestParam("user_id") String user_id) throws Exception {
		System.out.println(user_id);
		List<MyMessage> list= mymatchboardService.selectSendMessages(user_id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
			
		ModelAndView mv = new ModelAndView("main/mymatchboard/sendMessageList");
		mv.addObject("map", map);
		
		return mv;
	}
	
	//받은 메세지함
	@RequestMapping(value = "/openReceiveMessageList.do")
	public ModelAndView openReceiveMessageList(@RequestParam("user_id") String user_id) throws Exception {
		System.out.println(user_id);
		List<MyMessage> list= mymatchboardService.selectReceiveMessages(user_id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
			
		ModelAndView mv = new ModelAndView("main/mymatchboard/receiveMessageList");
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value = "/acceptMessage.do")
	public void acceptMessage(HttpServletResponse response, @RequestParam("sender_nm") String sender_nm,
			@RequestParam("receiver_id") String receiver_id) throws Exception {
		System.out.println("agree보낸사람" + sender_nm);
		System.out.println("agree받는사람" + receiver_id);
		
		String sender_id = mymatchboardService.selectReceiveId(sender_nm);
		System.out.println("agree id"+sender_id);
		
		int result = mymatchboardService.acceptMessage(sender_id, receiver_id);
		System.out.println(result);
		try {
	        response.getWriter().print(result);
	    } catch (IOException e) {
	        e.printStackTrace();
	    } 

	}
	
	@RequestMapping(value = "/refuseMessage.do")
	public void refuseMessage(HttpServletResponse response, @RequestParam("sender_nm") String sender_nm,
			@RequestParam("receiver_id") String receiver_id) throws Exception {
		System.out.println("refuse보낸사람" + sender_nm);
		System.out.println("refuse받는사람" + receiver_id);
		
		String sender_id = mymatchboardService.selectReceiveId(sender_nm);
		System.out.println("refuse id"+sender_id);
		
		int result = mymatchboardService.refuseMessage(sender_id, receiver_id);
		System.out.println(result);
		try {
	        response.getWriter().print(result);
	    } catch (IOException e) {
	        e.printStackTrace();
	    } 

	}
	
	@RequestMapping(value = "/readMessage.do")
	public void readMessage(HttpServletResponse response, @RequestParam("sender_id") String sender_id,
			@RequestParam("receiver_id") String receiver_id) throws Exception {
		
		System.out.println("읽은 메세지....");
		System.out.println("read보낸사람" + sender_id);
		System.out.println("read받는사람" + receiver_id);
		
		int result = mymatchboardService.readMessage(sender_id, receiver_id);
		System.out.println(result);
		try {
	        response.getWriter().print(result); //메세지성공
	    } catch (IOException e) {
	        e.printStackTrace();
	    } 
		

	}
	
	@RequestMapping(value = "/openSendGradeList.do")
	public ModelAndView openSendGradeList(@RequestParam("user_id") String user_id) throws Exception {
		
		List<Profileboard> list= mymatchboardService.selectSendGrades(user_id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		System.out.println(list);
		
		ModelAndView mv = new ModelAndView("main/mymatchboard/sendGradeList");
		mv.addObject("map", map);
		
		return mv;
	}
		
	@RequestMapping(value = "/openReceiveGradeList.do")
	public ModelAndView openReceiveGradeList(@RequestParam("user_id") String user_id) throws Exception {
		
		List<Profileboard> list= mymatchboardService.selectReceiveGrades(user_id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		System.out.println(list);
		
		ModelAndView mv = new ModelAndView("main/mymatchboard/receiveGradeList");
		mv.addObject("map", map);
		
		return mv;
	}
	
}