package com.godsky.findlove.main.mymatchboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.mymatchboard.model.service.MymatchboardService;
import com.godsky.findlove.main.profileboard.model.vo.Message;

import net.sf.json.JSONObject;
/**
 * Handles requests for the application home page.
 */
@Controller
public class MymatchboardController {
	
	public MymatchboardController() {}
	
	@Resource(name="mymatchboardService")
	private MymatchboardService mymatchboardService;
	
	@RequestMapping(value = "/openSendMessageList.do", method=RequestMethod.GET)
	public ModelAndView openSendMessagePage() throws Exception {
			
		ModelAndView mv = new ModelAndView("main/mymatchboard/sendMessageList");
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/openSendMessageList.do", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView openSendMessageList(@RequestParam("userId") String senderId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Message> list = mymatchboardService.selectSendMessage(senderId);
		System.out.println(senderId);
		JSONArray sendList = new JSONArray();
		for(Message message: list) {
			JSONObject jMessage = new JSONObject();
			jMessage.put("messageNo", message.getMessageNo());
			jMessage.put("receiverId", message.getReceiverId());
			jMessage.put("messageContent", message.getMessageContent());
			jMessage.put("sendDT", message.getSendDT().toString());
			jMessage.put("readFL", message.getReadFL());
			jMessage.put("acceptST", message.getAcceptST());
			
			sendList.add(jMessage);
		}
				map.put("sendList", sendList);
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addAllObjects(map);
		
		return mv;
	}
	
	@RequestMapping(value = "/openMessageDetail.do", method=RequestMethod.GET)
	public void openMessageDetail() throws Exception {
		
	}
	
}