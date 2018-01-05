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
import com.godsky.findlove.main.eventboard.poll.model.vo.PollAnswer;

@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService attendanceService;
	
	public AttendanceController() {}
	
	
	@RequestMapping(value = "attendancelist.do")
	public ModelAndView attendancelist(Model model, @RequestParam("userId") String userId) {

		List<Attendance> list = attendanceService.listAll(userId);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main/eventboard/attendance/attendancelist");
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping(value = "attendancebtn.do")
	public ModelAndView attendancebtn(@ModelAttribute Attendance abtn, Model model) {
		System.out.println(attendanceService.selectatt(abtn.getUserId()));
		if(attendanceService.selectatt(abtn.getUserId())==null){
		attendanceService.attendancebtn(abtn);
		}
		return attendancelist(model, abtn.getUserId());
		
	}
}
