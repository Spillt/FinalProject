package com.godsky.findlove.main.freeboard.vo;

import java.util.Date;

public class Freeboard {
	private int freeNo;
	private String freeTitle;
	private String freeWriter;
	private String freeContent;
	private String freeOnm;
	private String freeRnm;
	private Date freeDt;
	private int freeLevel;
	private int freeRef;
	private int freeReflyRef;
	private int freeReflySq;
	private int freeReadCnt;
	
	public Freeboard() {
		super();
	}

	public Freeboard(int freeNo, String freeTitle, String freeWriter, String freeContent, String freeOnm,
			String freeRnm, Date freeDt, int freeLevel, int freeRef, int freeReflyRef, int freeReflySq,
			int freeReadCnt) {
		super();
		this.freeNo = freeNo;
		this.freeTitle = freeTitle;
		this.freeWriter = freeWriter;
		this.freeContent = freeContent;
		this.freeOnm = freeOnm;
		this.freeRnm = freeRnm;
		this.freeDt = freeDt;
		this.freeLevel = freeLevel;
		this.freeRef = freeRef;
		this.freeReflyRef = freeReflyRef;
		this.freeReflySq = freeReflySq;
		this.freeReadCnt = freeReadCnt;
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

	public String getFreeOnm() {
		return freeOnm;
	}

	public void setFreeOnm(String freeOnm) {
		this.freeOnm = freeOnm;
	}

	public String getFreeRnm() {
		return freeRnm;
	}

	public void setFreeRnm(String freeRnm) {
		this.freeRnm = freeRnm;
	}

	public Date getFreeDt() {
		return freeDt;
	}

	public void setFreeDt(Date freeDt) {
		this.freeDt = freeDt;
	}

	public int getFreeLevel() {
		return freeLevel;
	}

	public void setFreeLevel(int freeLevel) {
		this.freeLevel = freeLevel;
	}

	public int getFreeRef() {
		return freeRef;
	}

	public void setFreeRef(int freeRef) {
		this.freeRef = freeRef;
	}

	public int getFreeReflyRef() {
		return freeReflyRef;
	}

	public void setFreeReflyRef(int freeReflyRef) {
		this.freeReflyRef = freeReflyRef;
	}

	public int getFreeReflySq() {
		return freeReflySq;
	}

	public void setFreeReflySq(int freeReflySq) {
		this.freeReflySq = freeReflySq;
	}

	public int getFreeReadCnt() {
		return freeReadCnt;
	}

	public void setFreeReadCnt(int freeReadCnt) {
		this.freeReadCnt = freeReadCnt;
	}
	
	@Override
	public String toString(){
		return this.freeNo + ", " + this.freeTitle + ", " + this.freeWriter + ", " + this.freeContent + ", " +
				this.freeOnm + ", " + this.freeRnm + ", " + this.freeDt + ", " + this.freeLevel + ", " + 
				this.freeRef + ", " + this.freeReflyRef + ", " + this.freeReflySq + ", " + this.freeReadCnt;
	}
}
