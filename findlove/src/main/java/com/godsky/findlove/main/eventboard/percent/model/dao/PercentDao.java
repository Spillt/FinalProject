package com.godsky.findlove.main.eventboard.percent.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.eventboard.percent.model.vo.Percent;


@Repository("PercentDao")
public class PercentDao {
@Autowired
	private SqlSessionTemplate sqlSession;

/*	public String percentname(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("percent.selectname", userId);
	}*/

	public List<Percent> list(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("percent.list", userId);
	}


}
