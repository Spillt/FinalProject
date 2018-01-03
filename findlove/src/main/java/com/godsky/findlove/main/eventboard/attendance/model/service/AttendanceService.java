package com.godsky.findlove.main.eventboard.attendance.model.service;

import java.util.ArrayList;
import java.util.List;

import com.godsky.findlove.main.eventboard.attendance.model.vo.Attendance;
import com.godsky.findlove.main.eventboard.poll.model.vo.PollAnswer;

public interface AttendanceService {

	List<Attendance> listAll(String userId);
	
	public void attendancebtn(Attendance abtn);

	String selectatt(String userId);


}
