package com.godsky.findlove.main.profileboard.model.vo;

public class Report {
	private int report_no;
	private String sender_id;
	private String receiver_id;
	private String report_content;
	 
	public Report() {}

	public Report(String sender_id, String receiver_id, String report_content) {
		super();
		this.sender_id = sender_id;
		this.receiver_id = receiver_id;
		this.report_content = report_content;
	}

	public Report(int report_no, String sender_id, String receiver_id, String report_content) {
		super();
		this.report_no = report_no;
		this.sender_id = sender_id;
		this.receiver_id = receiver_id;
		this.report_content = report_content;
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public String getSender_id() {
		return sender_id;
	}

	public void setSender_id(String sender_id) {
		this.sender_id = sender_id;
	}

	public String getReceiver_id() {
		return receiver_id;
	}

	public void setReceiver_id(String receiver_id) {
		this.receiver_id = receiver_id;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	@Override
	public String toString() {
		return "Report [report_no=" + report_no + ", sender_id=" + sender_id 
				+ ", receiver_id=" + receiver_id + ", report_content=" + report_content + "]";
	}
}
