package com.godsky.findlove.faq.controller;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.faq.service.FaqService;

@Controller
public class FaqController {
	Logger log = Logger.getLogger(this.getClass());
	@Resource(name = "FaqService")
	private FaqService FaqService;

	@RequestMapping(value = "/findlove/openFaqBoardList.do")
	public ModelAndView openfaqList(Map<string, object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/findlove/faqList");
		List<Map<String, Object>> list = FaqService.selectfaqList(commandMap);
		mv.addObject("list", list);
		return mv;
	}
}