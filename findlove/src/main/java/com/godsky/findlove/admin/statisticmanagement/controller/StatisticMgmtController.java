package com.godsky.findlove.admin.statisticmanagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StatisticMgmtController {

	public StatisticMgmtController() {}
	
	@RequestMapping(value="statisticlist.do")
	public String statisticManage() {
		return "admin/statistic/statisticlist";
	}
}
