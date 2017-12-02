package com.godsky.findlove.admin.faqmanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.godsky.findlove.admin.faqmanagement.model.service.FaqMgmtService;
import com.godsky.findlove.admin.faqmanagement.model.vo.Faq;

@Controller
public class FaqMgmtController {

	@Autowired
	private FaqMgmtService faqMgmtService;
	
	public FaqMgmtController() {}
	
	// faq 조회
	@RequestMapping(value="faqlist")
	public String faqList(Model model) {
		model.addAttribute("list", faqMgmtService.getFaqList());
		return null;
	}
	
	// faq 상세 및 선택
	@RequestMapping(value="faqdetail")
	public String faqDetail(int no, Model model) {
		model.addAttribute("faq", faqMgmtService.getFaq(no));
		return null;
	}
	
	// faq 등록
	@RequestMapping(value="insertfaq")
	public String insertFaq(Model model) {
		int result = faqMgmtService.insertFaq();
		return null;
	}
	
	// faq 수정
	@RequestMapping(value="updatefaq")
	public String updateFaq(Faq faq, Model model) {
		int result = faqMgmtService.updateFaq(faq);
		return null;
	}
	
	// faq 삭제
	@RequestMapping(value="deletefaq")
	public String deleteFaq(int no, Model model) {
		int result = faqMgmtService.deleteFaq(no);
		return null;
	}
}
