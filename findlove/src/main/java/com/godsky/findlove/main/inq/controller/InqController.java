package com.godsky.findlove.main.inq.controller;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.inq.model.service.InqService;

import com.godsky.findlove.main.common.common.CommandMap;

@Controller
public class InqController {
	Logger log = Logger.getLogger(this.getClass());
	@Resource(name = "InqService")
	private InqService InqService;

	@RequestMapping(value = "/findlove/openInqList.do")
	public ModelAndView openInqList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/findlove/InqList");
		List<Map<String, Object>> list = InqService.selectInqList(commandMap);
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping(value="/findlove/openInqDetail.do")
	public ModelAndView openInqDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/findlove/InqDetail");
		
		Map<String,Object> map = InqService.selectInqDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
}