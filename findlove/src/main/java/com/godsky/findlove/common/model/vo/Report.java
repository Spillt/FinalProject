package com.godsky.findlove.common.model.vo;

public class Report {

	private int report_no;
	private String report_type;
	private String sender_id;
	private String receiver_id;
	private String report_content;
	private String report_st;
	
	public Report() {}

	public Report(int report_no, String report_type, String sender_id, String receiver_id, String report_content,
			String report_st) {
		super();
		this.report_no = report_no;
		this.report_type = report_type;
		this.sender_id = sender_id;
		this.receiver_id = receiver_id;
		this.report_content = report_content;
		this.report_st = report_st;
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public String getReport_type() {
		return report_type;
	}

	public void setReport_type(String report_type) {
		this.report_type = report_type;
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

	public String getReport_st() {
		return report_st;
	}

	public void setReport_st(String report_st) {
		this.report_st = report_st;
	}

	@Override
	public String toString() {
		return "Report [report_no=" + report_no + ", report_type=" + report_type + ", sender_id=" + sender_id
				+ ", receiver_id=" + receiver_id + ", report_content=" + report_content + ", report_st=" + report_st
				+ "]";
	}
}
