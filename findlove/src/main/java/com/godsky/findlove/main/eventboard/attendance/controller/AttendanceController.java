package com.godsky.findlove.main.eventboard.attendance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.godsky.findlove.main.eventboard.attendance.model.service.AttendanceService;
import com.godsky.findlove.main.eventboard.attendance.model.vo.Attendance;

@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService attendanceService;
	
	public AttendanceController() {}
	
	// 일대일 문의 목록 전체 보기
	@RequestMapping(value="attendancelist.do")
	public String attendanceList(Model model) {
		/*model.addAttribute("list", attendanceService.getAttendanceList());*/
		return "main/eventboard/attendance/attendancelist";
	}
	
	// 일대일 문의 답변 대기글 보기
	@RequestMapping(value="attendancewaitlist.do")
	public String attendanceWaitList(Model model) {
		model.addAttribute("list", attendanceService.getAttendanceWaitList());
		return null;
	}
	
	// 일대일 문의 상세 보기
	@RequestMapping(value="attendancedetail.do")
	public String attendanceDetail(int no, Model model) {
		model.addAttribute("poll", attendanceService.getAttendance(no));
		return null;
	}
	
	// 일대일 문의 답변하기
	@RequestMapping(value="attendanceanswer.do")
	public String attendanceAnswer(Attendance attendance, Model model) {
		int result = attendanceService.attendanceAnswer(attendance);
		return null;
	}

}
