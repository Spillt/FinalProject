package com.godsky.findlove.admin.statisticmanagement.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.admin.statisticmanagement.model.dao.StatisticMgmtDao;
import com.godsky.findlove.admin.statisticmanagement.model.vo.StatisticResult;
import com.godsky.findlove.admin.usermanagement.model.vo.MatchCouple;
import com.godsky.findlove.admin.usermanagement.model.vo.UserDetail;
import com.godsky.findlove.main.freeboard.vo.Freeboard;

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
	@Override
	public List<StatisticResult> getAgeRatio(String gender) {
		return statisticMgmtDao.getAgeRatio(gender);
	}

	@Override
	public List<StatisticResult> getAreaRatio() {
		return statisticMgmtDao.getAreaRatio();
	}

	@Override
	public List<StatisticResult> getMembershipRatio() {
		return statisticMgmtDao.getMembershipRatio();
	}

	@Override
	public int getTotalMemberCnt() {
		return statisticMgmtDao.getTotalMemberCnt();
	}

	@Override
	public int getTodayMemberCnt() {
		return statisticMgmtDao.getTodayMemberCnt();
	}

	@Override
	public int getAttendanceCnt(int i) {
		return statisticMgmtDao.getAttendanceCnt(i);
	}

	@Override
	public List<UserDetail> getGradeTopNUser(int n) {
		return statisticMgmtDao.getGradeTopNUser(n);
	}

	@Override
	public List<UserDetail> getFavoriteTopNUser(int n) {
		return statisticMgmtDao.getFavoriteTopNUser(n);
	}

	@Override
	public List<MatchCouple> getMatchCouple(int n) {
		return statisticMgmtDao.getMatchCouple(n);
	}

	@Override
	public List<Freeboard> getPopularBoard(int n) {
		return statisticMgmtDao.getPopularBoard(n);
	}


}
