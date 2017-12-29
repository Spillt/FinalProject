package com.godsky.findlove.admin.statisticmanagement.model.service;

import java.util.List;

import com.godsky.findlove.admin.statisticmanagement.model.vo.StatisticResult;

public interface StatisticMgmtService {

	List<StatisticResult> getGenderRatio();

	List<StatisticResult> getAgeRatio();

}
