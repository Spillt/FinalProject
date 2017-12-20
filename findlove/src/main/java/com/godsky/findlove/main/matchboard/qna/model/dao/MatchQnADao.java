package com.godsky.findlove.main.matchboard.qna.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.matchboard.qna.model.vo.MatchQnA;
import com.godsky.findlove.main.matchboard.qna.model.vo.MatchUser;
import com.godsky.findlove.user.model.vo.Profile;
import com.godsky.findlove.user.model.vo.User;

@Repository("MatchQnADao")
public class MatchQnADao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
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

	public MatchUser selectUser(Profile profile) {
		return sqlSession.selectOne("matchUser.getUserCheck",profile);
	}

	public int insertMatchUser(User user) {
		return sqlSession.insert("matchUser.insertMatchUser",user); 
	}

	public int updateMatchUser(User user) {
		return sqlSession.update("matchUser.updateMatchUser",user);
	}

	public List<Profile> select3(MatchUser muser) {
		return sqlSession.selectList("profile.selectMatchUserList",muser);
	}

	public String selectUserGender(String userId) {
		return sqlSession.selectOne("profile.selectProfileOne",userId);
	}

	public List<String> selectUser3(String myGender) {
		return sqlSession.selectList("match.selectMatchuser3",myGender);
	}
}
