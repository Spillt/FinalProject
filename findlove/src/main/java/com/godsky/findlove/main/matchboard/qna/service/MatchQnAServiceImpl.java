package com.godsky.findlove.main.matchboard.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.godsky.findlove.main.matchboard.qna.dao.MatchQnADao;
import com.godsky.findlove.main.matchboard.qna.vo.MatchQnA;
import com.godsky.findlove.user.model.vo.User;

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
	
}
