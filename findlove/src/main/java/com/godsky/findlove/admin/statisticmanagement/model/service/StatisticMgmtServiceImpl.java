package com.godsky.findlove.admin.statisticmanagement.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.admin.statisticmanagement.model.dao.StatisticMgmtDao;
import com.godsky.findlove.admin.statisticmanagement.model.vo.StatisticResult;

@Service("statisticService")
public class StatisticMgmtServiceImpl implements StatisticMgmtService {

	@Autowired
	private StatisticMgmtDao statisticMgmtDao;
	
	@Override
	public List<StatisticResult> getGenderRatio() {
		return statisticMgmtDao.getGenderRatio();
	}

	@Override
	public List<StatisticResult> getAgeRatio() {
		return statisticMgmtDao.getAgeRatio();
	}

}
