package com.godsky.findlove.common.model.vo;

import java.sql.Date;

public class Notice {
	
	private int notice_no;
	private String notice_title;
	private String notice_content;
	private Date notice_dt;
	private int notice_read_cnt;
	
	public Notice() {}

	public Notice(int notice_no, String notice_title, String notice_content, Date notice_dt, int notice_read_cnt) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_dt = notice_dt;
		this.notice_read_cnt = notice_read_cnt;
	}

	public int getnotice_no() {
		return notice_no;
	}

	public void setnotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public Date getNotice_dt() {
		return notice_dt;
	}

	public void setNotice_dt(Date notice_dt) {
		this.notice_dt = notice_dt;
	}

	public int getNotice_read_cnt() {
		return notice_read_cnt;
	}

	public void setNotice_read_cnt(int notice_read_cnt) {
		this.notice_read_cnt = notice_read_cnt;
	}

	@Override
	public String toString() {
		return "Notice [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_content=" + notice_content
				+ ", notice_dt=" + notice_dt + ", notice_read_cnt=" + notice_read_cnt + "]";
	}
	
}
