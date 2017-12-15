package com.godsky.findlove.main.profileboard.model.dao;

import java.util.HashMap;
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
	
	public int countProfileList(String keyword) {
		// 검색옵션, 키워드 맵에 저장
	    Map<String, String> map = new HashMap<String, String>();
	    map.put("keyword", keyword);
	    return sqlSession.selectOne("profile.countProfile", map);
	}

	public List<Profileboard> selectProfileList(int start, int end, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
	    map.put("keyword", keyword);
	    map.put("start", start);
	    map.put("end", end);
		return sqlSession.selectList("profile.selectProfileList", map);
	}

	public Profileboard selectProfileDetail(String user_nicknm) {
		return sqlSession.selectOne("profile.selectProfileDetail", user_nicknm);
	}

}
