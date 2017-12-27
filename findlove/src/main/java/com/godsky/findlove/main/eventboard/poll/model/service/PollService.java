package com.godsky.findlove.main.eventboard.poll.model.service;

import java.util.List;
import com.godsky.findlove.main.eventboard.poll.model.vo.Poll;
import com.godsky.findlove.main.eventboard.poll.model.vo.PollAnswer;
import com.godsky.findlove.main.eventboard.poll.model.vo.PollResult;
public interface PollService {

	public List<Poll> listAll();
	public List<Poll> listAll(String userId);
	public Poll polldetail(int pollNo);
	public List<PollResult> pollResult(int pollNo);
	public void pollAnswer(PollAnswer answer);
}
