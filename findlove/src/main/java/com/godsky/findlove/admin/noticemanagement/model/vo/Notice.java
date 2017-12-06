package com.godsky.findlove.admin.noticemanagement.model.vo;

<<<<<<< HEAD
public class Notice {

=======
import java.sql.Date;

public class Notice {

	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private String noticeFileOName;
	private String noticeFileRName;
	private int noticeReadCnt;
	
	public Notice() {}

	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date noticeDate, String noticeFileOName,
			String noticeFileRName, int noticeReadCnt) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeFileOName = noticeFileOName;
		this.noticeFileRName = noticeFileRName;
		this.noticeReadCnt = noticeReadCnt;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getNoticeFileOName() {
		return noticeFileOName;
	}

	public void setNoticeFileOName(String noticeFileOName) {
		this.noticeFileOName = noticeFileOName;
	}

	public String getNoticeFileRName() {
		return noticeFileRName;
	}

	public void setNoticeFileRName(String noticeFileRName) {
		this.noticeFileRName = noticeFileRName;
	}

	public int getNoticeReadCnt() {
		return noticeReadCnt;
	}

	public void setNoticeReadCnt(int noticeReadCnt) {
		this.noticeReadCnt = noticeReadCnt;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeDate=" + noticeDate + ", noticeFileOName=" + noticeFileOName + ", noticeFileRName="
				+ noticeFileRName + ", noticeReadCnt=" + noticeReadCnt + "]";
	}
	
	
>>>>>>> Chanwoo
}
