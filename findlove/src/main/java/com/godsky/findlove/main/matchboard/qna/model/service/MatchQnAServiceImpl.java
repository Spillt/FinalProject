package com.godsky.findlove.main.matchboard.qna.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.matchboard.qna.model.dao.MatchQnADao;
import com.godsky.findlove.main.matchboard.qna.model.vo.MatchQnA;
import com.godsky.findlove.main.matchboard.qna.model.vo.MatchUser;
import com.godsky.findlove.main.matchboard.qna.model.vo.MatchUserProfile;
import com.godsky.findlove.main.matchboard.qna.model.vo.MatchingQuestion;
import com.godsky.findlove.common.model.vo.Profile;
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
	public int insertMatchUser(MatchUser newUser) {
		return  matchQnADao.insertMatchUser(newUser);
	}

	@Override
	public int updateMatchUser(MatchUser newUser) {
		return matchQnADao.updateMatchUser(newUser);
	}

	@Override
	public List<Profile> select3(MatchUser muser) {
		return matchQnADao.select3(muser);
	}


	@Override
	public String selectUserGender(String userId) {
		return matchQnADao.selectUserGender(userId);
	}

	@Override
	public List<String> selectUser3(MatchQnA myInfo) {
		return matchQnADao.selectUser3(myInfo);
	}

	@Override
	public MatchUser selectMyQnA(String userId) {
		return matchQnADao.selectMyQnA(userId);
	}

	@Override
	public String selectDate(String userId) {
		return matchQnADao.selectDate(userId);
	}

	@Override
	public List<MatchUserProfile> selectMatchUserProfileList(MatchUser todayMatchUser) {
		return matchQnADao.selectMatchUserProfileList(todayMatchUser);
	}

	@Override
	public List<MatchingQuestion> selectQuestion() {
		return matchQnADao.selectQuestion();
	}

	@Override
	public int insertMyQnA(MatchQnA myQnA) {
		return matchQnADao.insertMyQnA(myQnA);
	}

	@Override
	public List<MatchQnA> selectMyQuestion(String userId) {
		return matchQnADao.selectMyQuestion(userId);
	}

	@Override
	public List<MatchingQuestion> selectQuestion3() {
		return matchQnADao.selectQuestion3();
	}

	@Override
	public MatchQnA checkMatchingUserQnA(MatchQnA matchingUserQnA) {
		return matchQnADao.checkMatchingUserQnA(matchingUserQnA);
	}

	@Override
	public int todayMatchCheck(String userId) {
		return matchQnADao.todayMatchCheck(userId);
	}

	@Override
	public int updateMyQnA(MatchQnA myQnA) {
		return matchQnADao.updateMyQnA(myQnA);
	}
	
}
