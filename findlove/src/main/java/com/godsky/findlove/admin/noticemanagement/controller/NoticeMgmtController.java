package com.godsky.findlove.admin.noticemanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.godsky.findlove.admin.noticemanagement.model.service.NoticeMgmtService;
import com.godsky.findlove.admin.noticemanagement.model.vo.Notice;

@Controller
public class NoticeMgmtController {

	@Autowired
	private NoticeMgmtService noticeMgmtService;
	
	public NoticeMgmtController() {}
	
	// 공지사항 조회
	@RequestMapping(value="noticelist.do")
	public String noticeList(Model model) {
		model.addAttribute("list", noticeMgmtService.getNoticeList());
		return null;
	}
	
	// 공지사항 상세 및 선택
	@RequestMapping(value="noticedetail.do")
	public String noticeDetail(int no, Model model) {
		model.addAttribute("notice", noticeMgmtService.getNotice(no));
		return null;
	}
	
	// 공지사항 등록
	@RequestMapping(value="insertnotice.do")
	public String insertNotice(Model model) {
		int result = noticeMgmtService.insertNotice();
		return null;
	}
	
	// 공지사항 수정
	@RequestMapping(value="updatenotice.do")
	public String updateNotice(Notice notice, Model model) {
		int result = noticeMgmtService.updateNotice(notice);
		return null;
	}
	
	// 공지사항 삭제
	@RequestMapping(value="deletenotice.do")
	public String deleteNotice(int no, Model model) {
		int result = noticeMgmtService.deleteNotice(no);
		return null;
	}
}
