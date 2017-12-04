package com.godsky.findlove.main.eventboard.attendance.model.service;

import java.util.ArrayList;

import com.godsky.findlove.main.eventboard.attendance.model.vo.Attendance;

public interface AttendanceService {

	ArrayList<Attendance> getAttendanceList();
	ArrayList<Attendance> getAttendanceWaitList();
	Attendance getAttendance(int no);
	int attendanceAnswer(Attendance attendance);

}
