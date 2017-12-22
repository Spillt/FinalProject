package com.godsky.findlove.main.eventboard.poll.model.service;

import java.util.List;
import com.godsky.findlove.main.eventboard.poll.model.vo.Poll;
import com.godsky.findlove.main.eventboard.poll.model.vo.PollAnswer;
public interface PollService {

	public List<Poll> listAll();
	public Poll polldetail(int pollNo);
	public Poll pollResult(int pollNo);
	public void pollAnswer(PollAnswer answer);
}
