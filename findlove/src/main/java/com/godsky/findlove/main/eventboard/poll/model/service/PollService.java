package com.godsky.findlove.main.eventboard.poll.model.service;

import java.util.ArrayList;

import com.godsky.findlove.main.eventboard.poll.model.vo.Poll;

public interface PollService {

	ArrayList<Poll> getPollList();
	Poll getPolldetail();
	Poll getPoll(int no);
	int pollAnswer(Poll poll);
	static Object selectProfileList() {
		// TODO Auto-generated method stub
		return null;
	}
	

}
