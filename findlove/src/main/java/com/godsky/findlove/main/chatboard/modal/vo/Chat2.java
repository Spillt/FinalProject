package com.godsky.findlove.main.chatboard.modal.vo;

public class Chat2 {
	private String cmessage;
	private String to;
	private String from;
	
	public Chat2() {}
	
	public Chat2(String cmessage, String to, String from) {
		super();
		this.cmessage = cmessage;
		this.to = to;
		this.from = from;
	}

	public String getCmessage() {
		return cmessage;
	}

	public void setCmessage(String cmessage) {
		this.cmessage = cmessage;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	@Override
	public String toString() {
		return "Chat2 [cmessage=" + cmessage + ", to=" + to + ", from" + from + "]";
	}
}
