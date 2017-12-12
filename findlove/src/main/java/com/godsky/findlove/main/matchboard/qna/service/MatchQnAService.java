package com.godsky.findlove.main.matchboard.qna.service;

import java.util.List;

import com.godsky.findlove.main.matchboard.qna.vo.MatchQnA;
import com.godsky.findlove.user.model.vo.User;

public interface MatchQnAService {
	public List selectUserList(User User);
	
	public int insertUserQnA(MatchQnA QnA);
	
	public int updatetUserQnA(MatchQnA QnA);
	
	public int deleteUserQnA(MatchQnA QnA);
	
	public MatchQnA selectMatchQnA(MatchQnA QnA);
}
