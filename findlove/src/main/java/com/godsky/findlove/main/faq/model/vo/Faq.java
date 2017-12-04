package com.godsky.findlove.main.faq.model.vo;

import java.util.Date;

public class Faq {
	
	private int FaqNo;	// FAQ 번호
	private String FaqTitle; // FAQ 제목
	private String FaqDivision; // FAQ 구분
	private String FaqWriter; // FAQ 작성자 아이디
	private String FaqContent; // FAQ 내용
	private Date FaqDate; // FAQ 올린날짜
	private String FaqOriginalFilename; // FAQ 원래첨부파일명
	private String FaqRenameFilename; // FAQ 바뀐 첨부파일명
	
	public Faq() {
		super();
	}

	public Faq(int faqNo, String faqTitle, String faqDivision, String faqWriter, String faqContent, Date faqDate,
			String faqOriginalFilename, String faqRenameFilename) {
		super();
		FaqNo = faqNo;
		FaqTitle = faqTitle;
		FaqDivision = faqDivision;
		FaqWriter = faqWriter;
		FaqContent = faqContent;
		FaqDate = faqDate;
		FaqOriginalFilename = faqOriginalFilename;
		FaqRenameFilename = faqRenameFilename;
	}

	public int getFaqNo() {
		return FaqNo;
	}

	public void setFaqNo(int faqNo) {
		FaqNo = faqNo;
	}

	public String getFaqTitle() {
		return FaqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		FaqTitle = faqTitle;
	}

	public String getFaqDivision() {
		return FaqDivision;
	}

	public void setFaqDivision(String faqDivision) {
		FaqDivision = faqDivision;
	}

	public String getFaqWriter() {
		return FaqWriter;
	}

	public void setFaqWriter(String faqWriter) {
		FaqWriter = faqWriter;
	}

	public String getFaqContent() {
		return FaqContent;
	}

	public void setFaqContent(String faqContent) {
		FaqContent = faqContent;
	}

	public Date getFaqDate() {
		return FaqDate;
	}

	public void setFaqDate(Date faqDate) {
		FaqDate = faqDate;
	}

	public String getFaqOriginalFilename() {
		return FaqOriginalFilename;
	}

	public void setFaqOriginalFilename(String faqOriginalFilename) {
		FaqOriginalFilename = faqOriginalFilename;
	}

	public String getFaqRenameFilename() {
		return FaqRenameFilename;
	}

	public void setFaqRenameFilename(String faqRenameFilename) {
		FaqRenameFilename = faqRenameFilename;
	}

	@Override
	public String toString(){
		return this.FaqNo + ", " + this.FaqTitle + ", " + this.FaqDivision + ", " + this.FaqWriter + ", " + this.FaqContent + ", " +
				this.FaqDate + ", " + this.FaqOriginalFilename + ", " + this.FaqRenameFilename;
	}
}
