package com.godsky.findlove.admin.boardmanagement.model.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.admin.boardmanagement.model.vo.Board;
import com.godsky.findlove.common.model.vo.Faq;
import com.godsky.findlove.common.model.vo.Notice;
import com.godsky.findlove.common.model.vo.Poll;


@Repository("boardMgmtDao")
public class BoardMgmtDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Notice> selectNoticeList() {
		return sqlSession.selectList("boardMgmt.selectNoticeList");
	}
	public List<Faq> selectFaqList() {
		return sqlSession.selectList("boardMgmt.selectFaqList");
	}
	public List<Poll> selectPollList() {
		return sqlSession.selectList("boardMgmt.selectPollList");
	}

	public int insertNotice(Board board) {
		return sqlSession.insert("boardMgmt.insertNotice", board);
	}
	public int insertFaqList(Board board) {
		return sqlSession.insert("boardMgmt.insertFaq", board);

	}
	public int insertEventList(Board board) {
		return sqlSession.insert("boardMgmt.insertEvent", board);

	}
	public int deleteNotice(int boardNo) {
		return sqlSession.delete("boardMgmt.deleteNotice", boardNo);
	}
	public int deleteFaq(int boardNo) {
		return sqlSession.delete("boardMgmt.deleteFaq", boardNo);
	}
	public int deleteEvent(int boardNo) {
		return sqlSession.delete("boardMgmt.deleteEvent", boardNo);
	}
	
	public Notice selectNotice(int boardNo) {
		return sqlSession.selectOne("boardMgmt.selectNotice", boardNo);
	}
	public Faq selectFaq(int boardNo) {
		return sqlSession.selectOne("boardMgmt.selectFaq", boardNo);
	}
	public Poll selectEvent(int boardNo) {
		return sqlSession.selectOne("boardMgmt.selectEvent", boardNo);
	}
	public int updateNotice(Board board) {
		return sqlSession.update("boardMgmt.updateNotice", board);
	}
	public int updateFaq(Board board) {
		return sqlSession.update("boardMgmt.updateFaq", board);
	}
	public int updateEvent(Board board) {
		return sqlSession.update("boardMgmt.updateEvent", board);
	}
	public int getNoticeCnt() {
		return sqlSession.selectOne("boardMgmt.getNoticeCnt");
	}
	public int getFaqCnt() {
		return sqlSession.selectOne("boardMgmt.getFaqCnt");
	}
	public int getPollCnt() {
		return sqlSession.selectOne("boardMgmt.getPollCnt");
	}

	


}
