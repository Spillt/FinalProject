package com.godsky.findlove.main.noticeboard.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.godsky.findlove.main.noticeboard.model.vo.Notice;

public interface NoticeService {
		List<Notice> listAll();	//목록보기

		Notice read(int noticeNo);
		
		String prev(int noticeNo);
		
		String next(int noticeNo);

		void increaseViewcnt(int noticeNo, HttpSession session);
		
		List<Notice> PNwriteList(int noticeNo);

		int getNoticeCnt();
}
