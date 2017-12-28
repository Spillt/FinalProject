package com.godsky.findlove.main.eventboard.attendance.model.service;

import java.util.ArrayList;
import java.util.List;

import com.godsky.findlove.main.eventboard.attendance.model.vo.Attendance;

public interface AttendanceService {

	List<Attendance> listAll(String userId);


}
