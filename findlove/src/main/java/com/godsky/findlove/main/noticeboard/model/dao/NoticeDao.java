package com.godsky.findlove.main.noticeboard.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.noticeboard.model.vo.Notice;
	

@Repository("NoticeDao")
public class NoticeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void increaseViewcnt(int noticeNo) {
		sqlSession.update("notice.increaseViewcnt", noticeNo);
	}

	public List<Notice> listAll() {
		return sqlSession.selectList("notice.listAll");
	}

	public Notice read(int noticeNo) {
		return sqlSession.selectOne("notice.view", noticeNo);
	}

}
