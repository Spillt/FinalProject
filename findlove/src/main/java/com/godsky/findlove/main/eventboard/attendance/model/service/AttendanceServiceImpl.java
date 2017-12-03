package com.godsky.findlove.main.eventboard.attendance.model.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.eventboard.attendance.model.dao.AttendanceDao;
import com.godsky.findlove.main.eventboard.attendance.model.service.AttendanceService;
import com.godsky.findlove.main.eventboard.attendance.model.vo.Attendance;

@Service("attendanceService")
public class AttendanceServiceImpl {
	//dao 사용	
	@Autowired
	AttendanceDao attendanceDao;
	AttendanceService attendanceService;
	private String userId; 
	private Date attendanceDT;
	
	
	public Integer Count() {
		return null; 
		
	}
	
	public String Check(){
		return userId;
	}
	
	public List<Attendance> checkList(){
		return null;
	}
	


}
