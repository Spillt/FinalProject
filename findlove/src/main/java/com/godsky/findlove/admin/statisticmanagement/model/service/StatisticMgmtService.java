package com.godsky.findlove.admin.statisticmanagement.model.service;

import java.util.List;

import com.godsky.findlove.admin.statisticmanagement.model.vo.StatisticResult;
import com.godsky.findlove.admin.usermanagement.model.vo.MatchCouple;
import com.godsky.findlove.admin.usermanagement.model.vo.UserDetail;
import com.godsky.findlove.main.freeboard.vo.Freeboard;

public interface StatisticMgmtService {
	
	List<StatisticResult> getGenderRatio();

	List<StatisticResult> getAgeRatio();
	List<StatisticResult> getAgeRatio(String gender);

	List<StatisticResult> getAreaRatio();

	List<StatisticResult> getMembershipRatio();

	int getTotalMemberCnt();
	int getTodayMemberCnt();

	int getAttendanceCnt(int i);

	List<UserDetail> getGradeTopNUser(int n);

	List<UserDetail> getFavoriteTopNUser(int n);

	List<MatchCouple> getMatchCouple(int n);

	List<Freeboard> getPopularBoard(int i);

}
