package com.godsky.findlove.main.eventboard.attendance.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.eventboard.attendance.model.dao.AttendanceDao;
import com.godsky.findlove.main.eventboard.attendance.model.vo.Attendance;
import com.godsky.findlove.main.eventboard.poll.model.vo.PollAnswer;

@Service("AttendanceService")
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	AttendanceDao attendanceDao;
	
	@Override
	public List<Attendance> listAll(String userId) {
		return attendanceDao.listAll(userId);
	}
	@Override
	public void attendancebtn(Attendance abtn) {
		attendanceDao.attendancebtn(abtn);
	}
	@Override
	public String selectatt(String userId) {
		return attendanceDao.selectatt(userId);
	}
	
	
}
