package com.godsky.findlove.admin.faqmanagement.model.vo;

<<<<<<< HEAD
public class Faq {

=======
import java.sql.Date;

public class Faq {

	private int faqNo;
	private String faqTitle;
	private String faqGb;
	private String faqContent;
	private Date faqDate;
	private String faqFileOName;
	private String faqFileRName;
	private int faqReadCnt;
	
	public Faq() {}

	public Faq(int faqNo, String faqTitle, String faqGb, String faqContent, Date faqDate, String faqFileOName,
			String faqFileRName, int faqReadCnt) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqGb = faqGb;
		this.faqContent = faqContent;
		this.faqDate = faqDate;
		this.faqFileOName = faqFileOName;
		this.faqFileRName = faqFileRName;
		this.faqReadCnt = faqReadCnt;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqGb() {
		return faqGb;
	}

	public void setFaqGb(String faqGb) {
		this.faqGb = faqGb;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public Date getFaqDate() {
		return faqDate;
	}

	public void setFaqDate(Date faqDate) {
		this.faqDate = faqDate;
	}

	public String getFaqFileOName() {
		return faqFileOName;
	}

	public void setFaqFileOName(String faqFileOName) {
		this.faqFileOName = faqFileOName;
	}

	public String getFaqFileRName() {
		return faqFileRName;
	}

	public void setFaqFileRName(String faqFileRName) {
		this.faqFileRName = faqFileRName;
	}

	public int getFaqReadCnt() {
		return faqReadCnt;
	}

	public void setFaqReadCnt(int faqReadCnt) {
		this.faqReadCnt = faqReadCnt;
	}

	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqGb=" + faqGb + ", faqContent=" + faqContent
				+ ", faqDate=" + faqDate + ", faqFileOName=" + faqFileOName + ", faqFileRName=" + faqFileRName
				+ ", faqReadCnt=" + faqReadCnt + "]";
	}
	
	
>>>>>>> Chanwoo
}
