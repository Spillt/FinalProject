package com.godsky.findlove.main.eventboard.attendance.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.eventboard.attendance.model.vo.Attendance;

@Repository("attendanceDao")
public class AttendanceDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public static ArrayList<Attendance> getAttendanceList() {
		return null;
	}

	public ArrayList<Attendance> getAttendanceWaitList() {
		return null;
	}

	public Attendance getAttendance(int no) {
		return null;
	}

	public int attendanceAnswer(Attendance attendance) {
		return 0;
	}
}
