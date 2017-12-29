package com.godsky.findlove.admin.boardmanagement.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.admin.boardmanagement.model.dao.BoardMgmtDao;
import com.godsky.findlove.admin.boardmanagement.model.vo.Board;
import com.godsky.findlove.common.model.vo.Faq;
import com.godsky.findlove.common.model.vo.Notice;
import com.godsky.findlove.common.model.vo.Poll;


@Service("faqMgmtService")
public class BoardMgmtServiceImpl implements BoardMgmtService {
	
	@Autowired
	BoardMgmtDao boardMgmtDao;

	@Override
	public List<Notice> selectNoticeList() {
		return boardMgmtDao.selectNoticeList();
	}
	@Override
	public List<Faq> selectFaqList() {
		return boardMgmtDao.selectFaqList();
	}
	@Override
	public List<Poll> selectPollList() {
		return boardMgmtDao.selectPollList();
	}
	
	@Override
	public int insertNotice(Board board) {
		return boardMgmtDao.insertNotice(board);
	}
	@Override
	public int insertFaqList(Board board) {
		return boardMgmtDao.insertFaqList(board);
	}
	@Override
	public int insertEventList(Board board) {
		return boardMgmtDao.insertEventList(board);
	}
	
	@Override
	public int deleteNotice(int boardNo) {
		return boardMgmtDao.deleteNotice(boardNo);
	}
	@Override
	public int deleteFaq(int boardNo) {
		return boardMgmtDao.deleteFaq(boardNo);
	}
	@Override
	public int deleteEvent(int boardNo) {
		return boardMgmtDao.deleteEvent(boardNo);
	}
	
	@Override
	public Notice selectNotice(int boardNo) {
		return boardMgmtDao.selectNotice(boardNo);
	}
	@Override
	public Faq selectFaq(int boardNo) {
		return boardMgmtDao.selectFaq(boardNo);
	}
	@Override
	public Poll selectEvent(int boardNo) {
		return boardMgmtDao.selectEvent(boardNo);
	}
	
	@Override
	public int updateNotice(Board board) {
		return boardMgmtDao.updateNotice(board);
	}
	@Override
	public int updateFaq(Board board) {
		return boardMgmtDao.updateFaq(board);
	}
	@Override
	public int updateEvent(Board board) {
		return boardMgmtDao.updateEvent(board);
	}
	@Override
	public int getNoticeCnt() {
		return boardMgmtDao.getNoticeCnt();
	}
	@Override
	public int getFaqCnt() {
		return boardMgmtDao.getFaqCnt();
	}
	@Override
	public int getPollCnt() {
		return boardMgmtDao.getPollCnt();
	}
	

	
	

}
