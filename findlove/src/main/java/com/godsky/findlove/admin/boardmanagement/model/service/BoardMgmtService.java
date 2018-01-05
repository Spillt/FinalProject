package com.godsky.findlove.admin.boardmanagement.model.service;

import java.util.List;

import com.godsky.findlove.admin.boardmanagement.model.vo.Board;
import com.godsky.findlove.common.model.vo.Faq;
import com.godsky.findlove.common.model.vo.Notice;
import com.godsky.findlove.common.model.vo.Poll;
import com.godsky.findlove.main.inq.model.vo.Inq;

public interface BoardMgmtService {

	List<Notice> selectNoticeList(int startIdx, int lastIdx);
	List<Faq> selectFaqList(int startIdx, int lastIdx);
	List<Poll> selectPollList(int startIdx, int lastIdx);
	
	int insertNotice(Board board);
	int insertFaqList(Board board);
	int insertEventList(Board board);
	
	int deleteNotice(int boardNo);
	int deleteFaq(int boardNo);
	int deleteEvent(int boardNo);
	
	Notice selectNotice(int boardNo);
	Faq selectFaq(int boardNo);
	Poll selectEvent(int boardNo);
	int updateNotice(Board board);
	int updateFaq(Board board);
	int updateEvent(Board board);
	int getNoticeCnt();
	int getFaqCnt();
	int getPollCnt();
	
	
	List<Inq> getInqWaitList();
	Inq getInq(int inqNo);
	int getInqCnt();
	List<Notice> getNewNoticeList(int i);

}
