package com.godsky.findlove.admin.boardmanagement.model.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.admin.boardmanagement.model.vo.Board;
import com.godsky.findlove.common.model.vo.Faq;
import com.godsky.findlove.common.model.vo.Notice;
import com.godsky.findlove.common.model.vo.Poll;
import com.godsky.findlove.main.inq.model.vo.Inq;


@Repository("boardMgmtDao")
public class BoardMgmtDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Notice> selectNoticeList(int startIdx, int lastIdx) {
		Map<String, Integer> idxMap = new HashMap<String, Integer>();
		idxMap.put("startIdx", startIdx);
		idxMap.put("lastIdx", lastIdx);
		return sqlSession.selectList("boardMgmt.selectNoticeList", idxMap);
	}
	public List<Faq> selectFaqList(int startIdx, int lastIdx) {
		Map<String, Integer> idxMap = new HashMap<String, Integer>();
		idxMap.put("startIdx", startIdx);
		idxMap.put("lastIdx", lastIdx);
		return sqlSession.selectList("boardMgmt.selectFaqList", idxMap);
	}
	public List<Poll> selectPollList(int startIdx, int lastIdx) {
		Map<String, Integer> idxMap = new HashMap<String, Integer>();
		idxMap.put("startIdx", startIdx);
		idxMap.put("lastIdx", lastIdx);
		return sqlSession.selectList("boardMgmt.selectPollList", idxMap);
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
	public List<Inq> getInqWaitList() {
		return sqlSession.selectList("inq.selectWaitInqList");
	}
	public Inq getInqWaitList(int inqNo) {
		return sqlSession.selectOne("inq.detailInq", inqNo);
	}
	public int getInqCnt() {
		return sqlSession.selectOne("boardMgmt.getInqCnt");
	}
	public List<Notice> getNewNoticeList(int i) {
		return sqlSession.selectList("boardMgmt.getNewNoticeList", i);
	}

}
