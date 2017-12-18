package com.godsky.findlove.main.noticeboard.model.vo;

import java.sql.Date;

public class Notice {

	private int NoticeNo;
	private String NoticeTitle;
	private String NoticeContent;
	private Date NoticeDt;
	private String NoticeFileOnm;
	private String NoticeFileRnm;
	private int NoticeReadCnt;
	
	public Notice() {
		super();
	}

	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date noticeDt, String noticeFileOnm,
			String noticeFileRnm, int noticeReadCnt) {
		super();
		NoticeNo = noticeNo;
		NoticeTitle = noticeTitle;
		NoticeContent = noticeContent;
		NoticeDt = noticeDt;
		NoticeFileOnm = noticeFileOnm;
		NoticeFileRnm = noticeFileRnm;
		NoticeReadCnt = noticeReadCnt;
	}

	public int getNoticeNo() {
		return NoticeNo;
	}

	public String getNoticeTitle() {
		return NoticeTitle;
	}

	public String getNoticeContent() {
		return NoticeContent;
	}

	public Date getNoticeDt() {
		return NoticeDt;
	}

	public String getNoticeFileOnm() {
		return NoticeFileOnm;
	}

	public String getNoticeFileRnm() {
		return NoticeFileRnm;
	}

	public int getNoticeReadCnt() {
		return NoticeReadCnt;
	}

	public void setNoticeNo(int noticeNo) {
		NoticeNo = noticeNo;
	}

	public void setNoticeTitle(String noticeTitle) {
		NoticeTitle = noticeTitle;
	}

	public void setNoticeContent(String noticeContent) {
		NoticeContent = noticeContent;
	}

	public void setNoticeDt(Date noticeDt) {
		NoticeDt = noticeDt;
	}

	public void setNoticeFileOnm(String noticeFileOnm) {
		NoticeFileOnm = noticeFileOnm;
	}

	public void setNoticeFileRnm(String noticeFileRnm) {
		NoticeFileRnm = noticeFileRnm;
	}

	public void setNoticeReadCnt(int noticeReadCnt) {
		NoticeReadCnt = noticeReadCnt;
	}

	@Override
	public String toString() {
		
		return NoticeNo + ", " + NoticeTitle + ", " + NoticeContent + ", " + NoticeDt + ", " + NoticeFileOnm + ", " + NoticeFileRnm + ", " + NoticeReadCnt; 
	}
	
	
}
