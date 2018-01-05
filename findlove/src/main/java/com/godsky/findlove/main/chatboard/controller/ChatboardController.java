package com.godsky.findlove.main.chatboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.chatboard.modal.service.ChatboardService;
import com.godsky.findlove.main.chatboard.modal.vo.Chat;
import com.godsky.findlove.main.mymatchboard.model.service.MymatchboardService;
import com.godsky.findlove.user.model.vo.User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ChatboardController {

	public ChatboardController() {}
	
	@Resource(name="chatboardService")
	private ChatboardService chatboardService;

	@Resource(name="mymatchboardService")
	private MymatchboardService mymatchboardService;
	
	@RequestMapping(value = "/openChatList.do")
	public ModelAndView openChatList(@RequestParam("user_id") String user_id) {
		
		List<Chat> list = chatboardService.selectChatList(user_id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		
		ModelAndView mv = new ModelAndView("main/chatboard/chatboardList");
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value = "/chatting.do")
	public ModelAndView chat(ModelAndView mv, HttpSession session) {
		mv.setViewName("main/chatboard/chatting");
		return mv;
	}
	
	@RequestMapping(value = "/chatting1.do")
	public ModelAndView chat1(ModelAndView mv, HttpSession session,@RequestParam("matchingNickNM") String matchingNickNM,@RequestParam("userId") String userId) {
		System.out.println("aa : "+matchingNickNM);
		String matchingId = mymatchboardService.selectReceiveId(matchingNickNM);
		
		int insertChat = chatboardService.insertChat(userId,matchingId);
		mv.addObject("matchingId", matchingId);
		mv.setViewName("main/chatboard/chatting");
		return mv;
	}
	@RequestMapping(value = "checkChatStatus.do")
    public void checkChatStatus(@RequestParam("sender_id") String sender_id,@RequestParam("receiver_id") String matchingNickNM,HttpServletResponse response) {
		String receiver_id = mymatchboardService.selectReceiveId(matchingNickNM);
        int result = chatboardService.checkChatStatus(new User(sender_id,receiver_id));
        
        try {
        	response.getWriter().print(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
	
	/*@RequestMapping(value = "/deleteChat.do")
	public void deleteChat(@RequestParam("sessionid") String sessionid,@RequestParam("matchingId") String matchingId, HttpServletResponse response) {
		System.out.println("aa");
		int result = mymatchboardService.deleteChat(sessionid, matchingId);
		System.out.println(result);
		try {
        	response.getWriter().print(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
}
