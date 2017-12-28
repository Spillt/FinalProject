package com.godsky.findlove.admin.statisticmanagement.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.admin.statisticmanagement.model.vo.StatisticResult;

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
}
