package com.godsky.findlove.main.noticeboard.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.noticeboard.controller.NoticeController;
import com.godsky.findlove.main.noticeboard.model.dao.NoticeDao;
import com.godsky.findlove.main.noticeboard.model.vo.Notice;
@Service("NoticeService")

public class NoticeServiceImpl implements NoticeService{
	@Autowired
	NoticeDao NoticeDao;
	Notice Notice;
	
	@Override
	public String loginCheck() {
		// 로그인
		NoticeDao.loginCheck();
		return NoticeController.notice();
	}
	@Override
	public String checkRankGb() {
		NoticeDao.checkRankGb();
		return "checkid.do";
	}
	@Override
	public String updateNotice() {
		// 업데이트공지사항
		NoticeDao.updateNotice();
		return "noticeupdate.do";
	}
	@Override
	public String insertNotice() {
		// 공지사항삽입
		NoticeDao.insertNotice();
		return "noticeinsert.do";
	}
	@Override
	public String deleteNotice() {
		// 공지사항 삭제
		NoticeDao.deleteNotice();
		return "noticedelete.do";
	}

}
