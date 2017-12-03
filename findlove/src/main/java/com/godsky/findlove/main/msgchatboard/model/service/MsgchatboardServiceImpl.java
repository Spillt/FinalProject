package com.godsky.findlove.main.msgchatboard.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.msgchatboard.model.dao.MsgchatboardDao;
import com.godsky.findlove.main.msgchatboard.model.vo.Message;
import com.godsky.findlove.user.model.vo.Profile;

@Service("MsgchatboardService")
public class MsgchatboardServiceImpl implements MsgchatboardService {

	//dao 사용
	@Autowired
	MsgchatboardDao msgchatboardDao;
	Message message;
	
	@Override
	//내가 호감을 보낸 이성 리스트 조회
	public ArrayList<Message> senderList() {
		return null;
	}

	@Override
	//나애게 호감을 보낸 이성 리스트 조회
	public ArrayList<Message> receiverList() {
		return null;
	}

	@Override
	//이성 리스트 상세 조회
	public Profile selectProfile() {
		return null;
	}

}
