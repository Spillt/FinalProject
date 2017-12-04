package com.godsky.findlove.main.matchboard.score.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.matchboard.score.vo.MatchScore;
import com.godsky.findlove.user.model.vo.User;

@Repository("MatchScoreDao")
public class MatchScoreDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MatchScoreDao(){}
	
	public int insertScore(MatchScore score){
		return 0;
	}
	
	public MatchScore selectMatching(MatchScore score){
		return null;
	}
	
	public List allSelect(User user){
		return null;
	}
}
