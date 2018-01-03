package com.godsky.findlove.main.matchboard.score.model.service;

import java.util.List;

import com.godsky.findlove.main.matchboard.score.model.vo.MatchScore;
import com.godsky.findlove.user.model.vo.User;

public interface MatchScoreService {
	
	public int getListCount();
	
	public int insertScore(MatchScore score);
	
	public MatchScore selectMatching(MatchScore score);
	
	public List allSelect(User user);

	public List<MatchScore> selectList(int currentPage, int limit);
}