package com.godsky.findlove.main.eventboard.attendance.model.vo;

import java.sql.Date;

public class Attendance {
	private String userId;
	private Date attendanceDT;
	public Attendance() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Attendance(String userId, Date attendanceDT) {
		super();
		this.userId = userId;
		this.attendanceDT = attendanceDT;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getAttendanceDT() {
		return attendanceDT;
	}
	public void setAttendanceDT(Date attendanceDT) {
		this.attendanceDT = attendanceDT;
	}
	@Override
	public String toString() {
		return "Attendance [userId=" + userId + ", attendanceDT=" + attendanceDT + "]";
	}
	
	

}
