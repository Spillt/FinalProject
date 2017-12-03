package com.godsky.findlove.eventmain.attendance.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.eventmain.attendance.model.vo.Attendance;
@Repository("AttendanceDao")
public class AttendanceDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Attendance selectAttendance(){
		return null;
		}
	
	public boolean creatUser(){
		return false;
		
	}


}
