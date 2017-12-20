package com.godsky.findlove.main.freeboard.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.freeboard.service.FreeboardService;
import com.godsky.findlove.main.freeboard.vo.Freeboard;

@Controller
public class FreeboardController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "FreeboardService")
	private FreeboardService FreeboardService;

	@RequestMapping(value = "openFreeboardList.do")
	public ModelAndView openFreeboardList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/freeboard/freeboardList");

		List<Map<String, Object>> list = FreeboardService.selectFreeboardList(commandMap);
		// System.out.println(list); //출력확인
		mv.addObject("list", list);

		return mv;
	}
	
	//글쓰기 액션 호출
	@RequestMapping(value="openFreeboardWrite.do")
	public ModelAndView openFreeboardWrite() throws Exception{
		ModelAndView mv = new ModelAndView("/freeboard/freeboardWrite");
		
		return mv;
	}
	
	//작성하기
	@RequestMapping(value="insertFreeboard.do")
	public ModelAndView insertFreeboard(@ModelAttribute("Freeboard") Freeboard Freeboard) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/openFreeboardList");
		
		FreeboardService.insertFreeboard(Freeboard);
		
		return mv;
	}
	
}
