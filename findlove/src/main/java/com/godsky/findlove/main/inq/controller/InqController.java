package com.godsky.findlove.main.inq.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.inq.model.service.InqService;
import com.godsky.findlove.main.inq.model.vo.Inq;



@Controller
public class InqController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "InqService")
	private InqService inqService;
	
	//전체 리스트 조회
	@RequestMapping(value = "InqList.do")
	public ModelAndView InqList(@RequestParam("userId") String userId) throws Exception{
		ModelAndView mv = new ModelAndView("main/inq/inqList");
		
		List<Inq> list = inqService.selectInqList(userId);
		mv.addObject("list", list);
		
		return mv;
	}
	
	//작성하기 액션 호출
	@RequestMapping(value="openInqWrite.do")
	public ModelAndView openInqWrite() throws Exception{
		ModelAndView mv = new ModelAndView("main/inq/inqWrite");
		return mv;
	}
				
	//문의 작성
	@RequestMapping(value="insertInq.do")
	public ModelAndView insertInq(@ModelAttribute("Inq") Inq inq) throws Exception{
		inqService.insertInq(inq);
		return InqList(inq.getInqWriter());
	}
	
	//상세보기
	@RequestMapping(value="detailInq.do")
	public ModelAndView detailInq(@RequestParam(value="inqNo") int inqNo) throws Exception{
		ModelAndView mv = new ModelAndView("main/inq/inqDetail");
		mv.addObject("inq", inqService.detailInq(inqNo));
		return mv;
	}
	
	//삭제하기
	@RequestMapping(value="deleteInq.do")
	public ModelAndView deleteInq(@RequestParam(value="inqNo") int inqNo) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/InqList.do");
		
		inqService.deleteInq(inqNo);
		return mv;
	}
	
	//답변하기
	@RequestMapping(value="resendInq.do")
	public String resendInq(@ModelAttribute("Inq") Inq inq) throws Exception{
		inqService.resendInq(inq);
		return "forward:/inqlist.do";
	}
	
	//답변하기 액션 호출
	@RequestMapping(value="openInqResend.do")
	public ModelAndView openInqResend(@RequestParam(value="inqWriter") String inqWriter, @RequestParam(value="inqTitle") String inqTitle) throws Exception{
		ModelAndView mv = new ModelAndView("main/inq/inqResend");
		mv.addObject("inqWriter", inqWriter);
		mv.addObject("inqTitle", inqTitle);
		return mv;
	}
}
