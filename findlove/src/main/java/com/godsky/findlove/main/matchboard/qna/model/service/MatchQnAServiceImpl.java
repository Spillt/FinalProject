package com.godsky.findlove.main.matchboard.qna.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.matchboard.qna.model.dao.MatchQnADao;
import com.godsky.findlove.main.matchboard.qna.model.vo.MatchQnA;
import com.godsky.findlove.main.matchboard.qna.model.vo.MatchUser;
import com.godsky.findlove.user.model.vo.Profile;
import com.godsky.findlove.user.model.vo.User;
@Service("MatchQnAService")
public class MatchQnAServiceImpl implements MatchQnAService{
	
	@Autowired
	MatchQnADao matchQnADao;
	public List selectUserList(User User){
		return null;
	}
	
	public int insertUserQnA(MatchQnA QnA){
		return 0;
	}
	
	public int updatetUserQnA(MatchQnA QnA){
		return 0;
	}
	
	public int deleteUserQnA(MatchQnA QnA){
		return 0;
	}
	
	public MatchQnA selectMatchQnA(MatchQnA QnA){
		return null;
	}

	@Override
	public MatchUser selectUser(Profile profile) {
		
		return matchQnADao.selectUser(profile);
	}

	@Override
	public int insertMatchUser(User user) {
		return  matchQnADao.insertMatchUser(user);
	}

	@Override
	public int updateMatchUser(User user) {
		return matchQnADao.updateMatchUser(user);
	}

	@Override
	public List<Profile> select3(MatchUser muser) {
		return matchQnADao.select3(muser);
	}
	
}
