package com.godsky.findlove.main.matchboard.iwc.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.matchboard.iwc.model.vo.IdealWorldCup;

@Repository("IWCDao")
public class IWCDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<IdealWorldCup> list(String gender) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("idealworldcup.list16", gender);
	}

	public String selectUserGender(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("idealworldcup.selectProfileOne", userId);
	}

	}
