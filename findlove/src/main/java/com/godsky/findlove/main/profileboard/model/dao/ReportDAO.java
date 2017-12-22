package com.godsky.findlove.main.profileboard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.profileboard.model.vo.Report;

@Repository("reportDAO")
public class ReportDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int sendMessage(Report report) {
		return sqlSession.insert("report.sendReport",report);
	}

}
