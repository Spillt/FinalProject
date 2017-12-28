package com.godsky.findlove.main.eventboard.attendance.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.eventboard.attendance.model.vo.Attendance;

@Repository("attendanceDao")
public class AttendanceDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Attendance> listAll(String userId) {
		return sqlSession.selectList("attendance.listAll", userId);
	}
}
