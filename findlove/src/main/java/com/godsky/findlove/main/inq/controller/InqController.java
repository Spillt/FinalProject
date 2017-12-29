package com.godsky.findlove.main.inq.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.inq.model.service.InqService;



@Controller
public class InqController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "InqService")
	private InqService inqService;
	
	//전체 리스트 조회
	@RequestMapping(value = "InqList.do")
	public ModelAndView InqList(Map<String, Object> commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("main/inq/inqList");
		
		List<Map<String, Object>> list = inqService.selectInqList(commandMap);
		mv.addObject("list", list);
		
		return mv;
	}
}
