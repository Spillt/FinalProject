package com.godsky.findlove.admin.noticemanagement.model.service;

import java.util.ArrayList;

import com.godsky.findlove.admin.noticemanagement.model.vo.Notice;

public interface NoticeMgmtService {

	ArrayList<Notice> getNoticeList();
	Notice getNotice(int no);
	int insertNotice();
	int updateNotice(Notice notice);
	int deleteNotice(int no);

}
