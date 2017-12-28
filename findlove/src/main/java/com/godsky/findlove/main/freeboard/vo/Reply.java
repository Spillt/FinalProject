package com.godsky.findlove.main.freeboard.vo;

import java.util.Date;

public class Reply {
	private int ReplyNo; //댓글 번호
	private int FreeNo; //게시글 번호
	private String ReplyText; //댓글 내용
	private String ReplyWriter; //댓글 작성자 아이디
	private String ReplyNickNM; //댓글 작성자 닉네임
	private Date Regdate; //댓글 작성일자
	
	public Reply() {
		super();
	}

	public Reply(int replyNo, int freeNo, String replyText, String replyWriter, String replyNickNM, Date regdate) {
		super();
		ReplyNo = replyNo;
		FreeNo = freeNo;
		ReplyText = replyText;
		ReplyWriter = replyWriter;
		ReplyNickNM = replyNickNM;
		Regdate = regdate;
	}

	public int getReplyNo() {
		return ReplyNo;
	}

	public void setReplyNo(int replyNo) {
		ReplyNo = replyNo;
	}

	public int getFreeNo() {
		return FreeNo;
	}

	public void setFreeNo(int freeNo) {
		FreeNo = freeNo;
	}

	public String getReplyText() {
		return ReplyText;
	}

	public void setReplyText(String replyText) {
		ReplyText = replyText;
	}

	public String getReplyWriter() {
		return ReplyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		ReplyWriter = replyWriter;
	}

	public String getReplyNickNM() {
		return ReplyNickNM;
	}

	public void setReplyNickNM(String replyNickNM) {
		ReplyNickNM = replyNickNM;
	}

	public Date getRegdate() {
		return Regdate;
	}

	public void setRegdate(Date regdate) {
		Regdate = regdate;
	}

	@Override
	public String toString(){
		return this.ReplyNo + ", " + this.FreeNo + ", " + this.ReplyText + ", " + this.ReplyWriter + ", " + this.ReplyNickNM + ", " + this.Regdate;
	}
}
