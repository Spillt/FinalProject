package com.godsky.findlove.admin.statisticmanagement.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.admin.statisticmanagement.model.vo.StatisticResult;
import com.godsky.findlove.admin.usermanagement.model.vo.MatchCouple;
import com.godsky.findlove.admin.usermanagement.model.vo.UserDetail;
import com.godsky.findlove.main.freeboard.vo.Freeboard;

@Repository("statisticMgmtDao")
public class StatisticMgmtDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<StatisticResult> getGenderRatio() {
		return sqlSession.selectList("statisticMgmt.getGenderRatio");
	}

	public List<StatisticResult> getAgeRatio() {
		return sqlSession.selectList("statisticMgmt.getAgeRatio");
	}
	public List<StatisticResult> getAgeRatio(String gender) {
		return sqlSession.selectList("statisticMgmt.getAgeGenderRatio", gender);
	}

	public List<StatisticResult> getAreaRatio() {
		return sqlSession.selectList("statisticMgmt.getAreaRatio");
	}

	public List<StatisticResult> getMembershipRatio() {
		return sqlSession.selectList("statisticMgmt.getMembershipRatio");
	}

	public int getTotalMemberCnt() {
		return sqlSession.selectOne("statisticMgmt.getTotalMemberCnt");
	}

	public int getTodayMemberCnt() {
		return sqlSession.selectOne("statisticMgmt.getTodayMemberCnt");
	}

	public int getAttendanceCnt(int i) {
		return sqlSession.selectOne("statisticMgmt.getAttendanceCnt", i);
	}

	public List<UserDetail> getGradeTopNUser(int n) {
		return sqlSession.selectList("statisticMgmt.getGradeTopNUser", n);
	}

	public List<UserDetail> getFavoriteTopNUser(int n) {
		return sqlSession.selectList("statisticMgmt.getFavoriteTopNUser", n);
	}

	public List<MatchCouple> getMatchCouple(int n) {
		return sqlSession.selectList("statisticMgmt.getMatchCouple", n);
	}

	public List<Freeboard> getPopularBoard(int n) {
		return sqlSession.selectList("statisticMgmt.getPopularBoard", n);
	}
}
