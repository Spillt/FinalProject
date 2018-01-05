package com.godsky.findlove.main.faq.model.vo;

import java.util.Date;

public class Faq {
	private int faqNo; //FAQ 번호
	private String faqGB; //FAQ 구분
	private String faqTitle; //FAQ 제목
	private String faqContent; //FAQ 내용
	private String faqWriter; //FAQ 작성자
	private Date faqDate; //FAQ 작성일
	
	public Faq() {
		super();
	}

	public Faq(int faqNo, String faqGB, String faqTitle, String faqContent, String faqWriter, Date faqDate) {
		super();
		this.faqNo = faqNo;
		this.faqGB = faqGB;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqWriter = faqWriter;
		this.faqDate = faqDate;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqGB() {
		return faqGB;
	}

	public void setFaqGB(String faqGB) {
		this.faqGB = faqGB;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public String getFaqWriter() {
		return faqWriter;
	}

	public void setFaqWriter(String faqWriter) {
		this.faqWriter = faqWriter;
	}

	public Date getFaqDate() {
		return faqDate;
	}

	public void setFaqDate(Date faqDate) {
		this.faqDate = faqDate;
	}

	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", faqGB=" + faqGB + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent
				+ ", faqWriter=" + faqWriter + ", faqDate=" + faqDate + "]";
	}
}
