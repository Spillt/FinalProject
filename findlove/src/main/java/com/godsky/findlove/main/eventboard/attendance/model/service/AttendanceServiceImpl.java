package com.godsky.findlove.main.eventboard.attendance.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.eventboard.attendance.model.dao.AttendanceDao;
import com.godsky.findlove.main.eventboard.attendance.model.vo.Attendance;

@Service("AttendanceService")
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	AttendanceDao attendanceDao;

	@Override
	public ArrayList<Attendance> getAttendanceList() {
		return AttendanceDao.getAttendanceList();
	}

	@Override
	public ArrayList<Attendance> getAttendanceWaitList() {
		return attendanceDao.getAttendanceWaitList();
	}

	@Override
	public Attendance getAttendance(int no) {
		return attendanceDao.getAttendance(no);
	}

	@Override
	public int attendanceAnswer(Attendance attendance) {
		return attendanceDao.attendanceAnswer(attendance);
	}
	
	
}
