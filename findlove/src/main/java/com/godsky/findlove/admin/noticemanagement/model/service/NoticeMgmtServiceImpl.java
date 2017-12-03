package com.godsky.findlove.admin.noticemanagement.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.admin.noticemanagement.model.dao.NoticeMgmtDao;
import com.godsky.findlove.admin.noticemanagement.model.vo.Notice;

@Service("noticeMgmtService")
public class NoticeMgmtServiceImpl implements NoticeMgmtService {
	
	@Autowired
	NoticeMgmtDao noticeMgmtDao;
	
	@Override
	public ArrayList<Notice> getNoticeList() {
		return noticeMgmtDao.getNoticeList();
	}
	@Override
	public Notice getNotice(int no) {
		return noticeMgmtDao.getNotice(no);
	}
	@Override
	public int insertNotice() {
		return noticeMgmtDao.insertNotice();
	}
	@Override
	public int updateNotice(Notice notice) {
		return noticeMgmtDao.updateNotice(notice);
	}
	@Override
	public int deleteNotice(int no) {
		return noticeMgmtDao.deleteNotice(no);
	}

}
