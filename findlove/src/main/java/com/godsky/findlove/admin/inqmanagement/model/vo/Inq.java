package com.godsky.findlove.admin.inqmanagement.model.vo;

import java.sql.Date;

public class Inq {

	private int inqNo;
	private String inqTitle;
	private String inqContent;
	private Date inqDate;
	private String inqOriginalFileName;
	private String inqRenameFileName;
	private String inqWriter;
	private String inqRecive;
	
	public Inq() {}

	public Inq(int inqNo, String inqTitle, String inqContent, Date inqDate, String inqOriginalFileName,
			String inqRenameFileName, String inqWriter, String inqRecive) {
		super();
		this.inqNo = inqNo;
		this.inqTitle = inqTitle;
		this.inqContent = inqContent;
		this.inqDate = inqDate;
		this.inqOriginalFileName = inqOriginalFileName;
		this.inqRenameFileName = inqRenameFileName;
		this.inqWriter = inqWriter;
		this.inqRecive = inqRecive;
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

	public String getInqOriginalFileName() {
		return inqOriginalFileName;
	}

	public void setInqOriginalFileName(String inqOriginalFileName) {
		this.inqOriginalFileName = inqOriginalFileName;
	}

	public String getInqRenameFileName() {
		return inqRenameFileName;
	}

	public void setInqRenameFileName(String inqRenameFileName) {
		this.inqRenameFileName = inqRenameFileName;
	}

	public String getInqWriter() {
		return inqWriter;
	}

	public void setInqWriter(String inqWriter) {
		this.inqWriter = inqWriter;
	}

	public String getInqRecive() {
		return inqRecive;
	}

	public void setInqRecive(String inqRecive) {
		this.inqRecive = inqRecive;
	}

	@Override
	public String toString() {
		return "Inq [inqNo=" + inqNo + ", inqTitle=" + inqTitle + ", inqContent=" + inqContent + ", inqDate=" + inqDate
				+ ", inqOriginalFileName=" + inqOriginalFileName + ", inqRenameFileName=" + inqRenameFileName
				+ ", inqWriter=" + inqWriter + ", inqRecive=" + inqRecive + "]";
	}
	
	
}
