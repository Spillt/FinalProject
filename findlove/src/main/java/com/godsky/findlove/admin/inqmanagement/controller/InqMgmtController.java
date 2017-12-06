package com.godsky.findlove.admin.inqmanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.godsky.findlove.admin.inqmanagement.model.service.InqMgmtService;
import com.godsky.findlove.admin.inqmanagement.model.vo.Inq;

@Controller
public class InqMgmtController {
	
	@Autowired
	private InqMgmtService inqMgmtService;
	
	public InqMgmtController() {}
	
	// 일대일 문의 목록 전체 보기
	@RequestMapping(value="inqlist.do")
	public String inqList(Model model) {
		model.addAttribute("list", inqMgmtService.getInqList());
		return null;
	}
	
	// 일대일 문의 답변 대기글 보기
	@RequestMapping(value="inqwaitlist.do")
	public String inqWaitList(Model model) {
		model.addAttribute("list", inqMgmtService.getInqWaitList());
		return null;
	}
	
	// 일대일 문의 상세 보기
	@RequestMapping(value="inqdetail.do")
	public String inqDetail(int no, Model model) {
		model.addAttribute("inq", inqMgmtService.getInq(no));
		return null;
	}
	
	// 일대일 문의 답변하기
	@RequestMapping(value="inqanswer.do")
	public String inqAnswer(Inq inq, Model model) {
		int result = inqMgmtService.inqAnswer(inq);
		return null;
	}

}
