package com.godsky.findlove.main.eventboard.attendance.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.eventboard.attendance.model.dao.AttendanceDao;
import com.godsky.findlove.main.eventboard.attendance.model.vo.Attendance;

@Service("AttendanceService")
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	AttendanceDao attendanceDao;

	@Override
	public List<Attendance> listAll(String userId) {
		return attendanceDao.listAll(userId);
	}

	
	
}
