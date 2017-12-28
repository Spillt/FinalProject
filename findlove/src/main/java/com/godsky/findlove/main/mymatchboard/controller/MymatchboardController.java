package com.godsky.findlove.main.mymatchboard.controller;

import java.net.URLEncoder;
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
import com.godsky.findlove.main.profileboard.model.vo.Profileboard;

import net.sf.json.JSONObject;
/**
 * Handles requests for the application home page.
 */
@Controller
public class MymatchboardController {
	
	public MymatchboardController() {}
	
	@Resource(name="mymatchboardService")
	private MymatchboardService mymatchboardService;
	
	@RequestMapping(value = "/openSendMessageList.do")
	public ModelAndView openSendMessageList(@RequestParam("sender_id") String sender_id) throws Exception {
		System.out.println(sender_id);
		List<MyMessage> list= mymatchboardService.selectSendMessages(sender_id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
			
		ModelAndView mv = new ModelAndView("main/mymatchboard/sendMessageList");
		mv.addObject("map", map);
		
		return mv;
	}
	
	
	@RequestMapping(value = "/openMessageDetail.do", method=RequestMethod.GET)
	public void openMessageDetail() throws Exception {
		
	}
	
	@RequestMapping(value = "/openSendGradeList.do")
	public ModelAndView openSendGradeList(@RequestParam("sender_id") String sender_id) throws Exception {
		
		List<Profileboard> list= mymatchboardService.selectSendGrades(sender_id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
			
		ModelAndView mv = new ModelAndView("main/mymatchboard/sendGradeList");
		mv.addObject("map", map);
		
		return mv;
	}
	
	
}