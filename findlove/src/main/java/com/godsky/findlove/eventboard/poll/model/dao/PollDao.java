package com.godsky.findlove.eventboard.poll.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.eventboard.poll.model.vo.Poll;

@Repository("pollDao")
public class PollDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public void deletePollInfo() {
		return;
	}

	public void insertPollInfo() {
		return;

	}

	public List selectPollDetail() {
		return null;
	}

	public List selectPollList() {
		return null;
	}

	public void updatePoll() {

	}

}
