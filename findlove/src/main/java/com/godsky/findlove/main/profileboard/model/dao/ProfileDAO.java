package com.godsky.findlove.main.profileboard.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.profileboard.model.vo.Profileboard;

@Repository("profileDAO")
public class ProfileDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Profileboard> selectProfileList() {
		return sqlSession.selectList("profile.selectProfileList");
	}

	public Profileboard selectProfileDetail(int user_nicknm) {
		return sqlSession.selectOne("profile.selectProfileDetail", user_nicknm);
	}

}
