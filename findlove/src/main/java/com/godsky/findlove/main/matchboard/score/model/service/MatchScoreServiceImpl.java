package com.godsky.findlove.main.matchboard.score.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.matchboard.score.model.dao.MatchScoreDao;
import com.godsky.findlove.main.matchboard.score.model.vo.MatchScore;
import com.godsky.findlove.user.model.vo.User;
@Service("MatchScoreService")
public class MatchScoreServiceImpl implements MatchScoreService{
	@Autowired
	private MatchScoreDao matchScoreDao;
	
	@Override
	public int getListCount() {
		return matchScoreDao.getListCount();
	}
	
	@Override
	public List<MatchScore> selectList(int currentPage, int limit) {
		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit - 1;
		return matchScoreDao.selectList(startRow,endRow);
	}
	
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
