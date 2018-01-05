package com.godsky.findlove.admin.boardmanagement.model.vo;

public class Board {
	
	private String boardType;
	private int boardNo;
	private String title;
	private String faqType;
	private String content;
	private String eventAnswer1;
	private String eventAnswer2;
	private String eventAnswer3;
	private String startDate;
	private String endDate;
	
	public Board() {
		super();
	}

	public Board(String boardType, int boardNo, String title, String faqType, String content, String eventAnswer1,
			String eventAnswer2, String eventAnswer3, String startDate, String endDate) {
		super();
		this.boardType = boardType;
		this.boardNo = boardNo;
		this.title = title;
		this.faqType = faqType;
		this.content = content;
		this.eventAnswer1 = eventAnswer1;
		this.eventAnswer2 = eventAnswer2;
		this.eventAnswer3 = eventAnswer3;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFaqType() {
		return faqType;
	}

	public void setFaqType(String faqType) {
		this.faqType = faqType;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getEventAnswer1() {
		return eventAnswer1;
	}

	public void setEventAnswer1(String eventAnswer1) {
		this.eventAnswer1 = eventAnswer1;
	}

	public String getEventAnswer2() {
		return eventAnswer2;
	}

	public void setEventAnswer2(String eventAnswer2) {
		this.eventAnswer2 = eventAnswer2;
	}

	public String getEventAnswer3() {
		return eventAnswer3;
	}

	public void setEventAnswer3(String eventAnswer3) {
		this.eventAnswer3 = eventAnswer3;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "Board [boardType=" + boardType + ", boardNo=" + boardNo + ", title=" + title + ", faqType=" + faqType
				+ ", content=" + content + ", eventAnswer1=" + eventAnswer1 + ", eventAnswer2=" + eventAnswer2
				+ ", eventAnswer3=" + eventAnswer3 + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}
	
}
