package com.godsky.findlove.main.freeboard.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.freeboard.service.FreeboardService;

@Controller
public class FreeboardController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="FreeboardService")
	private FreeboardService FreeboardService;
	
	@RequestMapping(value="openFreeboardList.do")
	public ModelAndView openFreeboardList(Map<String, Object> commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/freeboard/freeboardList");
		
		List<Map<String, Object>> list = FreeboardService.selectFreeboardList(commandMap);
		System.out.println(list);
		mv.addObject("list", list);
		
		return mv;
	}

}
