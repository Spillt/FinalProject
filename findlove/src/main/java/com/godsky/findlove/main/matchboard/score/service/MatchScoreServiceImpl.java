package com.godsky.findlove.main.matchboard.score.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.matchboard.score.dao.MatchScoreDao;
import com.godsky.findlove.main.matchboard.score.vo.MatchScore;
import com.godsky.findlove.user.model.vo.User;
@Service("MatchScoreService")
public class MatchScoreServiceImpl implements MatchScoreService{
	@Autowired
	MatchScoreDao matchScoreDao;
	
	@Override
	public int insertScore(MatchScore score){
		return 0;
	}
	
	@Override
	public MatchScore selectMatching(MatchScore score){
		return null;
	}
	
	@Override
	public List allSelect(User user){
		return null;
	}
}
