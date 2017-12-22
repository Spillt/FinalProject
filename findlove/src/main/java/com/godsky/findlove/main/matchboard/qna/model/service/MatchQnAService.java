package com.godsky.findlove.main.matchboard.qna.model.service;

import java.util.List;

import com.godsky.findlove.main.matchboard.qna.model.vo.MatchQnA;
import com.godsky.findlove.main.matchboard.qna.model.vo.MatchUser;
import com.godsky.findlove.common.model.vo.Profile;
import com.godsky.findlove.user.model.vo.User;

public interface MatchQnAService {
	public List selectUserList(User User);
	
	public int insertUserQnA(MatchQnA QnA);
	
	public int updatetUserQnA(MatchQnA QnA);
	
	public int deleteUserQnA(MatchQnA QnA);
	
	public MatchQnA selectMatchQnA(MatchQnA QnA);

	public MatchUser selectUser(Profile profile);

	public int insertMatchUser(User user);

	public int updateMatchUser(User user);

	public List<Profile> select3(MatchUser muser);

	
}
