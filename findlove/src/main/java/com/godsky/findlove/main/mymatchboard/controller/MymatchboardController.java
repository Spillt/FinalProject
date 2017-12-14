package com.godsky.findlove.main.mymatchboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.mymatchboard.model.service.MymatchboardService;
import com.godsky.findlove.main.profileboard.model.vo.Message;
/**
 * Handles requests for the application home page.
 */
@Controller
public class MymatchboardController {
	
	public MymatchboardController() {}
	
	@Resource(name="mymatchboardService")
	private MymatchboardService mymatchboardService;
	
	@RequestMapping(value = "/mymatchboard/openSendMessageList.do")
	public ModelAndView openSendMessageList(@RequestParam String senderId) throws Exception {
		
		System.out.println(senderId);
		List<Message> list = mymatchboardService.selectSendMessage(senderId);
		System.out.println(list);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		ModelAndView mv = new ModelAndView("main/mymatchboard/sendMessageList");
		mv.addObject("map", map);
		System.out.println(list);
		
		return mv;
	}
	
	/*@RequestMapping(value = "/mymatchboard/openReceiverMessageList.do")
	public ModelAndView openReceiverMessageList(@RequestParam String user_id) throws Exception {
		List<Message> receiverMessage = mymatchboardService.selectReceiverMessage(user_id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("receiverMessage", receiverMessage);
		System.out.println(receiverMessage);
		
		ModelAndView mv = new ModelAndView("main/mymatchboard/receiverMessageList");
		return mv;
	}*/
}
