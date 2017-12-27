package com.godsky.findlove.main.eventboard.poll.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.eventboard.poll.model.vo.Poll;
import com.godsky.findlove.main.eventboard.poll.model.vo.PollAnswer;
import com.godsky.findlove.main.eventboard.poll.model.vo.PollResult;

@Repository("pollDao")
public class PollDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Poll> listAll() {
		return sqlSession.selectList("poll.listAll");
	}

	public List<Poll> listAll(String userId) {
		return sqlSession.selectList("poll.mylist", userId);
	}

	public Poll polldetail(int pollNo) {
		return sqlSession.selectOne("poll.detail", pollNo);
	}

	public List<PollResult> pollResult(int pollNo) {
		return sqlSession.selectList("poll.result", pollNo);
	}

	public void pollAnswer(PollAnswer answer) {
		sqlSession.insert("poll.answer", answer);
	}

}
