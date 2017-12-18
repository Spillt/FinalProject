package com.godsky.findlove.main.matchboard.qna.vo;

import java.io.Serializable;
import java.util.Date;

public class MatchUser implements Serializable {
	private String myId;
	private Date insertDate;
	private String userId1;
	private String userId2;
	private String userId3;
	
	public MatchUser() {
		super();
	}

	public MatchUser(String myId, Date insertDate, String userId1, String userId2, String userId3) {
		super();
		this.myId = myId;
		this.insertDate = insertDate;
		this.userId1 = userId1;
		this.userId2 = userId2;
		this.userId3 = userId3;
	}

	public String getMyId() {
		return myId;
	}

	public void setMyId(String myId) {
		this.myId = myId;
	}

	public Date getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}

	public String getUserId1() {
		return userId1;
	}

	public void setUserId1(String userId1) {
		this.userId1 = userId1;
	}

	public String getUserId2() {
		return userId2;
	}

	public void setUserId2(String userId2) {
		this.userId2 = userId2;
	}

	public String getUserId3() {
		return userId3;
	}

	public void setUserId3(String userId3) {
		this.userId3 = userId3;
	}

	@Override
	public String toString(){
		return this.myId + "," + this.insertDate + "," + this.userId1 + "," + this.userId2 + "," + this.userId3;
	}
}