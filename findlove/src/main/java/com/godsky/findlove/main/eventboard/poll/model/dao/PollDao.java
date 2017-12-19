package com.godsky.findlove.main.eventboard.poll.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.eventboard.poll.model.vo.Poll;

@Repository("pollDao")
public class PollDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Poll> listAll(){
		return sqlSession.selectList("poll.listAll");
	}

	public Poll getPolldetail(int pollNo) {
		return null;//SqlSession.selectone("Poll.detail");
	}
	
	public Poll getPoll(int no) {
		return null;
	}

	public int pollAnswer(Poll poll) {
		return 0;
	}

}
