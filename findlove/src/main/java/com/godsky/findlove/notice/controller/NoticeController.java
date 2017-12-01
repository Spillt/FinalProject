package com.godsky.findlove.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.godsky.findlove.notice.model.service.NoticeService;
import com.godsky.findlove.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	public NoticeController() {
	}
	//공지사항게시판
	@RequestMapping(value = "notice.do")
	public String notice() {
		noticeService.loginCheck();
		return "notice";
	}
	//관리자확인
	@RequestMapping(value = "checkid.do")
	public String noticeDetail() {
		noticeService.checkRankGb();
		return "notice";
	}
	//업데이트
	@RequestMapping(value = "noticeupdate.do")
	public String updateNotice() {
		noticeService.updateNotice();
		return "notice";
	}
	@RequestMapping(value = "noticeinsert.do")
	public String insertNotice() {
		noticeService.insertNotice();
		return "notice";
	}
	@RequestMapping(value = "noticedelete.do")
	public String deleteNotice() {
		noticeService.deleteNotice();
		return "notice";
	}
}
