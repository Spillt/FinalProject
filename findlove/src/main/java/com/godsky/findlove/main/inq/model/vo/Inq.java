package com.godsky.findlove.main.inq.model.vo;

import java.util.Date;

public class Inq {
	private int inqNo; //일대일 문의 번호
	private String inqTitle; //일대일 문의 제목
	private String inqContent; //일대일 문의 내용
	private Date inqDate; //일대일 문의 작성일자
	private String inqOFN; //일대일 문의 원래 첨부파일명
	private String inqRFN; //일대일 문의 바뀐 첨부파일명
	private String inqWriter; //일대일 문의 보내는 유저
	private String inqReciver; //일대일 문의 받는 유저
	
	public Inq() {
		super();
	}

	public Inq(int inqNo, String inqTitle, String inqContent, Date inqDate, String inqOFN, String inqRFN,
			String inqWriter, String inqReciver) {
		super();
		this.inqNo = inqNo;
		this.inqTitle = inqTitle;
		this.inqContent = inqContent;
		this.inqDate = inqDate;
		this.inqOFN = inqOFN;
		this.inqRFN = inqRFN;
		this.inqWriter = inqWriter;
		this.inqReciver = inqReciver;
	}

	public int getInqNo() {
		return inqNo;
	}

	public void setInqNo(int inqNo) {
		this.inqNo = inqNo;
	}

	public String getInqTitle() {
		return inqTitle;
	}

	public void setInqTitle(String inqTitle) {
		this.inqTitle = inqTitle;
	}

	public String getInqContent() {
		return inqContent;
	}

	public void setInqContent(String inqContent) {
		this.inqContent = inqContent;
	}

	public Date getInqDate() {
		return inqDate;
	}

	public void setInqDate(Date inqDate) {
		this.inqDate = inqDate;
	}

	public String getInqOFN() {
		return inqOFN;
	}

	public void setInqOFN(String inqOFN) {
		this.inqOFN = inqOFN;
	}

	public String getInqRFN() {
		return inqRFN;
	}

	public void setInqRFN(String inqRFN) {
		this.inqRFN = inqRFN;
	}

	public String getInqWriter() {
		return inqWriter;
	}

	public void setInqWriter(String inqWriter) {
		this.inqWriter = inqWriter;
	}

	public String getInqReciver() {
		return inqReciver;
	}

	public void setInqReciver(String inqReciver) {
		this.inqReciver = inqReciver;
	}

	@Override
	public String toString(){
		return this.inqNo + ", " + this.inqTitle + ", " + this.inqContent + ", " + this.inqDate + ", " 
				+ this.inqOFN + ", " + this.inqRFN + ", " + this.inqWriter + ", " + this.inqReciver;
	}
}
