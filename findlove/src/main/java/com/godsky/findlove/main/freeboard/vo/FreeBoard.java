package com.godsky.findlove.freeBoard.vo;

import java.util.Date;

public class FreeBoard {

	private int freeNo; // 자유게시판 번호
	private String freeDivision; // 자유게시판 구분
	private String freeTitle; // 자유게시판 제목
	private String freeWriter; // 자유게시판 작성자
	private String freeContent; // 자유게시판 내용
	private String freeOriginalFilename; // 업로드한 원래 파일명
	private String freeRenameFilename; // 바뀐 파일명
	private Date freeDate; // 자유게시판 올린 날짜
	private int freeLeve; // 글레벨 : 원글 0, 원글의 답글 1, 답글의 답글 2
	private int freeRef; // 원글일때는 자기번호, 답글일 때 참조하는 원글 번호
	private int freeReplyRef; // 원글일때는 0, 레벨이 1이면 자기번호, 레벨이 2이면 참조하는 답글번호
	private int freeReplySeq; // 답글의 순번
	private int freeReadCount; // 조회수
	
	public FreeBoard() {
		super();
	}

	public FreeBoard(int freeNo, String freeDivision, String freeTitle, String freeWriter, String freeContent,
			String freeOriginalFilename, String freeRenameFilename, Date freeDate, int freeLeve, int freeRef,
			int freeReplyRef, int freeReplySeq, int freeReadCount) {
		super();
		this.freeNo = freeNo;
		this.freeDivision = freeDivision;
		this.freeTitle = freeTitle;
		this.freeWriter = freeWriter;
		this.freeContent = freeContent;
		this.freeOriginalFilename = freeOriginalFilename;
		this.freeRenameFilename = freeRenameFilename;
		this.freeDate = freeDate;
		this.freeLeve = freeLeve;
		this.freeRef = freeRef;
		this.freeReplyRef = freeReplyRef;
		this.freeReplySeq = freeReplySeq;
		this.freeReadCount = freeReadCount;
	}

	public int getFreeNo() {
		return freeNo;
	}

	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
	}

	public String getFreeDivision() {
		return freeDivision;
	}

	public void setFreeDivision(String freeDivision) {
		this.freeDivision = freeDivision;
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

	public String getFreeOriginalFilename() {
		return freeOriginalFilename;
	}

	public void setFreeOriginalFilename(String freeOriginalFilename) {
		this.freeOriginalFilename = freeOriginalFilename;
	}

	public String getFreeRenameFilename() {
		return freeRenameFilename;
	}

	public void setFreeRenameFilename(String freeRenameFilename) {
		this.freeRenameFilename = freeRenameFilename;
	}

	public Date getFreeDate() {
		return freeDate;
	}

	public void setFreeDate(Date freeDate) {
		this.freeDate = freeDate;
	}

	public int getFreeLeve() {
		return freeLeve;
	}

	public void setFreeLeve(int freeLeve) {
		this.freeLeve = freeLeve;
	}

	public int getFreeRef() {
		return freeRef;
	}

	public void setFreeRef(int freeRef) {
		this.freeRef = freeRef;
	}

	public int getFreeReplyRef() {
		return freeReplyRef;
	}

	public void setFreeReplyRef(int freeReplyRef) {
		this.freeReplyRef = freeReplyRef;
	}

	public int getFreeReplySeq() {
		return freeReplySeq;
	}

	public void setFreeReplySeq(int freeReplySeq) {
		this.freeReplySeq = freeReplySeq;
	}

	public int getFreeReadCount() {
		return freeReadCount;
	}

	public void setFreeReadCount(int freeReadCount) {
		this.freeReadCount = freeReadCount;
	}
	
	@Override
	public String toString(){
		return this.freeNo + ", " + this.freeDivision + ", " + this.freeTitle + ", " + this.freeWriter + ", " + 
				this.freeContent + ", " + this.freeOriginalFilename + ", " + this.freeRenameFilename + ", " +
				this.freeDate + ", " + this.freeLeve + ", " + this.freeRef + ", " + this.freeReplyRef + ", " +
				this.freeReplySeq + ", " + this.freeReadCount;
	}
}
