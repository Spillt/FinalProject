package com.godsky.findlove.main.eventboard.poll.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.eventboard.poll.model.dao.PollDao;
import com.godsky.findlove.main.eventboard.poll.model.vo.Poll;

@Service("pollService")
public class PollServiceImpl implements PollService {

	@Autowired
	PollDao pollDao;

	@Override
	public List<Poll> listAll(){
		return pollDao.listAll();
	}

	@Override
	public Poll getPolldetail() {
		return pollDao.getPolldetail();
	}

	@Override
	public Poll getPoll(int no) {
		return pollDao.getPoll(no);
	}

	@Override
	public int pollAnswer(Poll poll) {
		return pollDao.pollAnswer(poll);
	}
	
	
}
