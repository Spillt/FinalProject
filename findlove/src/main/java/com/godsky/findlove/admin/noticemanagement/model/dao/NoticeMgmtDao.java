package com.godsky.findlove.admin.noticemanagement.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.admin.noticemanagement.model.vo.Notice;

@Repository("noticeMgmtDao")
public class NoticeMgmtDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Notice> getNoticeList() {
		return null;
	}

	public Notice getNotice(int no) {
		return null;
	}

	public int insertNotice() {
		return 0;
	}

	public int updateNotice(Notice notice) {
		return 0;
	}

	public int deleteNotice(int no) {
		return 0;
	}

}
