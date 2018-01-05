package com.godsky.findlove.main.freeboard.vo;

import java.util.Date;

public class Freeboard {
	private int freeNo;
	private String freeTitle;
	private String freeWriter;
	private String freeContent;
	private Date freeDt;
	private int freeReadCnt;
	private String freeYN;
	
	public Freeboard() {
		super();
	}

	public Freeboard(int freeNo, String freeTitle, String freeWriter, String freeContent, Date freeDt, int freeReadCnt,
			String freeYN) {
		super();
		this.freeNo = freeNo;
		this.freeTitle = freeTitle;
		this.freeWriter = freeWriter;
		this.freeContent = freeContent;
		this.freeDt = freeDt;
		this.freeReadCnt = freeReadCnt;
		this.freeYN = freeYN;
	}

	public int getFreeNo() {
		return freeNo;
	}

	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
	}

	public String getFreeTitle() {
		return freeTitle;
	}

	public void setFreeTitle(String freeTitle) {
		this.freeTitle = freeTitle;
	}

	public String getFreeWriter() {
		return freeWriter;
	}

	public void setFreeWriter(String freeWriter) {
		this.freeWriter = freeWriter;
	}

	public String getFreeContent() {
		return freeContent;
	}

	public void setFreeContent(String freeContent) {
		this.freeContent = freeContent;
	}

	public Date getFreeDt() {
		return freeDt;
	}

	public void setFreeDt(Date freeDt) {
		this.freeDt = freeDt;
	}

	public int getFreeReadCnt() {
		return freeReadCnt;
	}

	public void setFreeReadCnt(int freeReadCnt) {
		this.freeReadCnt = freeReadCnt;
	}

	public String getFreeYN() {
		return freeYN;
	}

	public void setFreeYN(String freeYN) {
		this.freeYN = freeYN;
	}

	@Override
	public String toString() {
		return "Freeboard [freeNo=" + freeNo + ", freeTitle=" + freeTitle + ", freeWriter=" + freeWriter
				+ ", freeContent=" + freeContent + ", freeDt=" + freeDt + ", freeReadCnt=" + freeReadCnt + ", freeYN="
				+ freeYN + "]";
	}
	
}
