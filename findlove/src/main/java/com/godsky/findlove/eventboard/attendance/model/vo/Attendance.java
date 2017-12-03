package com.godsky.findlove.eventboard.attendance.model.vo;

import java.sql.Date;
import java.util.List;

public class Attendance {
	
	private String userId; 
	private Date attendanceDT;
	private int count;
	private int check;
	
	public Attendance(){
		super();
	}

	

	public Attendance(String userId, Date attendanceDT, int count, int check) {
		super();
		this.userId = userId;
		this.attendanceDT = attendanceDT;
		this.count = count;
		this.check = check;
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
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	
	public int getCheck() {
		return check;
	}



	public void setCheck(int attendance) {
		this.check = attendance;
	}



	@Override
	public String toString() {
		return "Attendance [userId=" + userId + ", attendanceDT=" + attendanceDT + ", count=" + count + ", check="
				+ check + "]";
	}	

}
