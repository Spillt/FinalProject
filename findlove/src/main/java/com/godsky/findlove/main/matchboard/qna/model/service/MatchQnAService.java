package com.godsky.findlove.main.matchboard.qna.model.service;

import java.util.ArrayList;
import java.util.List;

import com.godsky.findlove.main.matchboard.qna.model.vo.MatchQnA;
import com.godsky.findlove.main.matchboard.qna.model.vo.MatchUser;
import com.godsky.findlove.main.matchboard.qna.model.vo.MatchUserProfile;
import com.godsky.findlove.main.matchboard.qna.model.vo.MatchingQuestion;
import com.godsky.findlove.user.model.vo.Profile;
import com.godsky.findlove.user.model.vo.User;

public interface MatchQnAService {
	public List selectUserList(User User);
	
	public int insertUserQnA(MatchQnA QnA);
	
	public int updatetUserQnA(MatchQnA QnA);
	
	public int deleteUserQnA(MatchQnA QnA);
	
	public MatchQnA selectMatchQnA(MatchQnA QnA);

	public MatchUser selectUser(Profile profile);

	public int insertMatchUser(MatchUser newUser);

	public int updateMatchUser(MatchUser newUser);

	public List<Profile> select3(MatchUser muser);

	public String selectUserGender(String userId);

	public List<String> selectUser3(String myGender);

	public MatchUser selectMyQnA(String userId);

	public String selectDate(String userId);

	public List<MatchUserProfile> selectMatchUserProfileList(MatchUser todayMatchUser);

	public List<MatchingQuestion> selectQuestion();

	public int insertMyQnA(MatchQnA myQnA);

	public List<MatchQnA> selectMyQuestion(String userId);

	public List<MatchingQuestion> selectQuestion3();

	public MatchQnA checkMatchingUserQnA(MatchQnA matchingUserQnA);

	public int todayMatchCheck(String userId);

	public int updateMyQnA(MatchQnA myQnA);

	
}
