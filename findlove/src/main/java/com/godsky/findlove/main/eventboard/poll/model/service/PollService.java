package com.godsky.findlove.main.eventboard.poll.model.service;

import java.util.List;
import com.godsky.findlove.main.eventboard.poll.model.vo.Poll;
public interface PollService {

	public List<Poll> listAll();
	public Poll getPolldetail(int pollNo);
	Poll getPoll(int no);
	int pollAnswer(Poll poll);
	static Object selectProfileList() {
		// TODO Auto-generated method stub
		return null;
	}
	

}
