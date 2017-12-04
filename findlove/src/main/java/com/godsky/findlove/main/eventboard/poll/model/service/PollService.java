package com.godsky.findlove.main.eventboard.poll.model.service;

import java.util.ArrayList;

import com.godsky.findlove.main.eventboard.poll.model.vo.Poll;

public interface PollService {

	ArrayList<Poll> getPollList();
	ArrayList<Poll> getPollWaitList();
	Poll getPoll(int no);
	int pollAnswer(Poll poll);

}
