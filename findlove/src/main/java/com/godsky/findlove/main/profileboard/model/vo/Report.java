package com.godsky.findlove.main.profileboard.model.vo;

public class Report {
	private int reportNo;
	private String senderId;
	private String receiverId;
	private String reportContent;
	 
	public Report() {}

	public Report(int reportNo, String senderId, String receiverId, String reportContent) {
		super();
		this.reportNo = reportNo;
		this.senderId = senderId;
		this.receiverId = receiverId;
		this.reportContent = reportContent;
	}
	
	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public String getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", senderId=" + senderId 
				+ ", receiverId=" + receiverId + ", reportContent=" + reportContent + "]";
	}
}
