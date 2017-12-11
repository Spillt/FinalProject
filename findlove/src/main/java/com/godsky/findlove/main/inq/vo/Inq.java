package com.godsky.findlove.main.inq.vo;

import java.util.Date;

public class Inq {
	
	private int inqNo;
	private String inqTitle;
	private String inqContent;
	private Date inqDate;
	private String inqOriginalFilename;
	private String inqRenameFilename;
	private String inqWriter;
	private String inqReciver;
	
	public Inq() {
		super();
	}

	public Inq(int inqNo, String inqTitle, String inqContent, Date inqDate, String inqOriginalFilename,
			String inqRenameFilename, String inqWriter, String inqReciver) {
		super();
		this.inqNo = inqNo;
		this.inqTitle = inqTitle;
		this.inqContent = inqContent;
		this.inqDate = inqDate;
		this.inqOriginalFilename = inqOriginalFilename;
		this.inqRenameFilename = inqRenameFilename;
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

	public String getInqOriginalFilename() {
		return inqOriginalFilename;
	}

	public void setInqOriginalFilename(String inqOriginalFilename) {
		this.inqOriginalFilename = inqOriginalFilename;
	}

	public String getInqRenameFilename() {
		return inqRenameFilename;
	}

	public void setInqRenameFilename(String inqRenameFilename) {
		this.inqRenameFilename = inqRenameFilename;
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
		return this.inqNo + ", " + this.inqTitle + ", " + this.inqContent + ", " + this.inqDate + ", " + this.inqOriginalFilename + ", " +
				this.inqRenameFilename + ", " + this.inqWriter + ", " + this.inqReciver;
	}

}
