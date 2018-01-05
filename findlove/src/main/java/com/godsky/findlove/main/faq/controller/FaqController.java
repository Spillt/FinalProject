package com.godsky.findlove.main.faq.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.faq.model.service.FaqService;
import com.godsky.findlove.main.faq.model.vo.Faq;

@Controller
public class FaqController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="FaqService")
	private FaqService faqService;
	
	//구분 별 리스트 전체 조회
	@RequestMapping(value="openFaqList.do")
	public ModelAndView openFaqList(@RequestParam(value="faqGB")String faqGB) throws Exception{
		ModelAndView mv = new ModelAndView("main/faq/faqList");
		List<Faq> list = faqService.openFaqList(faqGB);
		for(Faq faq : list) {
			System.out.println(faq);
		}
		int num = 0;
		switch(faqGB) {
		case "계정": num=0; break;
		case "결제": num=1; break;
		case "게시판": num=2; break;
		case "매칭": num=3; break;
		case "이벤트": num=4; break;
		case "프로필": num=5; break;
		}
		mv.addObject("list", list);
		mv.addObject("gbNum", num);
		return mv;
	}
	
	//상세보기
	@RequestMapping(value="faqDetail.do")
	public ModelAndView faqDetail(@RequestParam(value="faqNo") int faqNo) throws Exception{
		ModelAndView mv = new ModelAndView("main/faq/faqDetail");
		mv.addObject("faq", faqService.faqDetail(faqNo));
		return mv;
	}

}
