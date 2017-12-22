package com.godsky.findlove.main.noticeboard.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.noticeboard.model.dao.NoticeDao;
import com.godsky.findlove.main.noticeboard.model.vo.Notice;

@Service("NoticeService")

public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeDao noticeDao;
	Notice notice;

	@Override
	public List<Notice> listAll() {
		return noticeDao.listAll();
	}

	@Override
	public Notice read(int noticeNo) {
		return noticeDao.read(noticeNo);
	}

	@Override
	public void increaseViewcnt(int noticeNo, HttpSession session) {
		long update_time = 0;
        if(session.getAttribute("update_time_"+noticeNo) != null){
           /* update_time = (long)session.getAttribute("update_time_"+noticeNo);*/
        }
        long current_time = System.currentTimeMillis();
        if(current_time - update_time > 5*1000){
            noticeDao.increaseViewcnt(noticeNo);
            session.setAttribute("update_time_"+noticeNo, current_time);
            
        }
		
	}

}
