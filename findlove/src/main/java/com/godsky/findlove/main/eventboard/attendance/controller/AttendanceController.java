package com.godsky.findlove.main.eventboard.attendance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.eventboard.attendance.model.service.AttendanceService;
import com.godsky.findlove.main.eventboard.attendance.model.vo.Attendance;

@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService attendanceService;
	
	public AttendanceController() {}
	
	// 일대일 문의 목록 전체 보기
	
	@RequestMapping(value = "attendancelist.do")
	public ModelAndView pollAnswer(@RequestParam("userId") String userId) {

		List<Attendance> list = attendanceService.listAll(userId);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main/eventboard/attendance/attendancelist");
		mv.addObject("mylist", list);
		return mv;
	}
	
}
