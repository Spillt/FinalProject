package com.godsky.findlove.admin.statisticmanagement.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.admin.statisticmanagement.model.service.StatisticMgmtService;
import com.godsky.findlove.admin.statisticmanagement.model.vo.StatisticResult;

@Controller
public class StatisticMgmtController {
	
	@Autowired
	private StatisticMgmtService statisticService;

	public StatisticMgmtController() {}
	
	@RequestMapping(value="statisticlist.do")
	public String statisticManage(Model model) {
		
		int totalCnt = statisticService.getTotalMemberCnt();
		model.addAttribute("totalCnt", totalCnt);
		int todayCnt = statisticService.getTodayMemberCnt();
		model.addAttribute("todayCnt", todayCnt);
		model.addAttribute("todayCntPct", (int)(todayCnt*1./totalCnt*100));
		
		int todayAttendance = statisticService.getAttendanceCnt(0);
		System.out.println(todayAttendance);
		model.addAttribute("todayAttendance", todayAttendance);
		int yesterdayAttendance = statisticService.getAttendanceCnt(1);
		model.addAttribute("yesterdayAttendance", yesterdayAttendance);
		
		List<StatisticResult> genderRatio = statisticService.getGenderRatio();
		model.addAttribute("genderRatio", genderRatio);
		
		List<StatisticResult> ageRatio = statisticService.getAgeRatio();
		model.addAttribute("ageRatio", ageRatio);
		List<StatisticResult> ageManRatio = statisticService.getAgeRatio("M");
		model.addAttribute("ageManRatio", ageManRatio);
		List<StatisticResult> ageWomanRatio = statisticService.getAgeRatio("F");
		model.addAttribute("ageWomanRatio", ageWomanRatio);
		
		List<StatisticResult> areaRatio = statisticService.getAreaRatio();
		model.addAttribute("areaRatio", areaRatio);
		
		List<StatisticResult> membershipRatio = statisticService.getMembershipRatio();
		model.addAttribute("membershipRatio", membershipRatio);
		
		return "admin/statistic/statisticlist";
	}

}
