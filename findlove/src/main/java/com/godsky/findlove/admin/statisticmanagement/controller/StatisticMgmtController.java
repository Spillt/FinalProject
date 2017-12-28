package com.godsky.findlove.admin.statisticmanagement.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.godsky.findlove.admin.statisticmanagement.model.service.StatisticMgmtService;
import com.godsky.findlove.admin.statisticmanagement.model.vo.StatisticResult;

@Controller
public class StatisticMgmtController {
	
	@Autowired
	private StatisticMgmtService statisticService;

	public StatisticMgmtController() {}
	
	@RequestMapping(value="statisticlist.do")
	public String statisticManage(Model model) {
		
		List<StatisticResult> genderRatio = statisticService.getGenderRatio();
		model.addAttribute("genderRatio", genderRatio);
		
		List<StatisticResult> ageRatio = statisticService.getAgeRatio();
		System.out.println(ageRatio);
		model.addAttribute("ageRatio", ageRatio);
		return "admin/statistic/statisticlist";
	}
}
