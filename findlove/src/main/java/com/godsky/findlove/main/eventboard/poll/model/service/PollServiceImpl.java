package com.godsky.findlove.main.eventboard.poll.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.eventboard.poll.model.dao.PollDao;
import com.godsky.findlove.main.eventboard.poll.model.vo.Poll;

@Service("pollService")
public class PollServiceImpl {

	// Dao사용
	PollDao pollDao;
	PollService pollsevice;

	// 질문 생성
	public void insertPollInfo() {
		return;
	}

	// 질문 삭제
	public List deletePollInfo() {
		return null;
	}

	// 질문 찾기
	public List selectPollDetail() {
		return null;
	}

	// 질문목록
	public List selectPollList() {
		return null;
	}

	// 질문업데이트
	public void updatePoll() {

	}
}
