package com.godsky.findlove.main.matchboard.score.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.matchboard.score.vo.MatchScore;
import com.godsky.findlove.user.model.vo.User;

@Repository("matchScoreDao")
public class MatchScoreDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MatchScoreDao(){}
	
	public int getListCount() {
		return sqlSession.selectOne("getListCount");
	}
	
	public int insertScore(MatchScore score){
		return 0;
	}
	
	public MatchScore selectMatching(MatchScore score){
		return null;
	}
	
	public List allSelect(User user){
		return null;
	}

	public List<MatchScore> selectList(int startRow, int endRow) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startRow", startRow); 
		map.put("endRow", endRow); 
		return sqlSession.selectList("selectList", map);
		
	}


}
