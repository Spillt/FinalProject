package com.godsky.findlove.main.eventboard.attendance.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.eventboard.attendance.model.dao.AttendanceDao;
import com.godsky.findlove.main.eventboard.attendance.model.vo.Attendance;

@Service
public class AttendanceService {
	
	@Autowired

	// 출첵 횟수 가져오기
	public Integer getCount(String userId) {
		return null; 
	}
	
	// 출첵 횟수 가져오기
	public String setCheck(String userId) {
		return userId; 
	}
	
	public List<Attendance> checkList(String userId){
		return null;
	}
	

}