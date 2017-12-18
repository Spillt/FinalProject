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
import com.godsky.findlove.main.mymatchboard.model.vo.MyMessage;

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
	public ModelAndView openSendMessageList(@RequestParam("sender_id") String sender_id) throws Exception {
		System.out.println(sender_id);
		Map<String, Object> map = new HashMap<String, Object>();
		List<MyMessage> list = mymatchboardService.selectSendMessages(sender_id);
		
		JSONArray sendList = new JSONArray();
		for(MyMessage message: list) {
			JSONObject jMessage = new JSONObject();
			jMessage.put("userNickNM", message.getUser_nicknm());
			jMessage.put("messageContent", message.getMessage_content());
			jMessage.put("sendDT", message.getSend_DT().toString());
			jMessage.put("readFL", message.getRead_FL());
			jMessage.put("acceptST", message.getAccept_ST());
			
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