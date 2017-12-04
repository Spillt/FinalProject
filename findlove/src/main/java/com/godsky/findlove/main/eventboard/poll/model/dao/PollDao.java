package com.godsky.findlove.main.eventboard.poll.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.eventboard.poll.model.vo.Poll;

@Repository("pollDao")
public class PollDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public static ArrayList<Poll> getPollList() {
		return null;
	}

	public ArrayList<Poll> getPollWaitList() {
		return null;
	}

	public Poll getPoll(int no) {
		return null;
	}

	public int pollAnswer(Poll poll) {
		return 0;
	}
}
