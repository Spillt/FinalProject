package com.godsky.findlove.common.model.vo;

public class Faq {
	
	private int faq_no;
	private String faq_gb;
	private String faq_title;
	private String faq_content;
	
	public Faq() {
		super();
	}

	public Faq(int faq_no, String faq_gb, String faq_title, String faq_content) {
		super();
		this.faq_no = faq_no;
		this.faq_gb = faq_gb;
		this.faq_title = faq_title;
		this.faq_content = faq_content;
	}

	public int getFaq_no() {
		return faq_no;
	}

	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}

	public String getFaq_gb() {
		return faq_gb;
	}

	public void setFaq_gb(String faq_gb) {
		this.faq_gb = faq_gb;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	@Override
	public String toString() {
		return "Faq [faq_no=" + faq_no + ", faq_gb=" + faq_gb + ", faq_title=" + faq_title + ", faq_content="
				+ faq_content + "]";
	}

}
