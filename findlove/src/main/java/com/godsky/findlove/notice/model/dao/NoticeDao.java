package com.godsky.findlove.notice.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.notice.model.vo.Notice;

@Repository("NoticeDao")
public class NoticeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Notice loginCheck(){
		return null;
	}
	public String checkRankGb(){
		return null;
	}
	public String updateNotice(){
		return null;
	}
	public String insertNotice(){
		return null;
	}
	public String deleteNotice(){
		return null;
	}
	
}
