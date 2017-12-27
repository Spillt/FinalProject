package com.godsky.findlove.main.eventboard.poll.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.eventboard.poll.model.dao.PollDao;
import com.godsky.findlove.main.eventboard.poll.model.vo.Poll;
import com.godsky.findlove.main.eventboard.poll.model.vo.PollAnswer;
import com.godsky.findlove.main.eventboard.poll.model.vo.PollResult;

@Service("pollService")
public class PollServiceImpl implements PollService {

	@Autowired
	PollDao pollDao;

	@Override
	public List<Poll> listAll() {
		return pollDao.listAll();
	}

	@Override
	public List<Poll> listAll(String userId) {
		return pollDao.listAll(userId);
	}

	@Override
	public Poll polldetail(int pollNo) {
		return pollDao.polldetail(pollNo);
	}

	@Override
	public List<PollResult> pollResult(int pollNo) {
		return pollDao.pollResult(pollNo);
	}

	@Override
	public void pollAnswer(PollAnswer answer) {
		pollDao.pollAnswer(answer);
	}

}
