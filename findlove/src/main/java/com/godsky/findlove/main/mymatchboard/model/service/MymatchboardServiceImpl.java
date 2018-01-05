package com.godsky.findlove.main.mymatchboard.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.godsky.findlove.main.mymatchboard.model.dao.MyMessageDAO;
import com.godsky.findlove.main.mymatchboard.model.vo.MyMessage;
import com.godsky.findlove.main.profileboard.model.vo.Profileboard;

@Service("mymatchboardService")
public class MymatchboardServiceImpl implements MymatchboardService{

	@Resource(name="myMessageDAO")
    private MyMessageDAO myMessageDAO;
	
	@Override
	public List<MyMessage> selectSendMessages(String user_id) {
		return myMessageDAO.selectSendMessages(user_id);
	}
	
	@Override
	public List<MyMessage> selectReceiveMessages(String user_id) {
		return myMessageDAO.selectReceiveMessages(user_id);
	}

	@Override
	public List<Profileboard> selectSendGrades(String user_id) {
		return myMessageDAO.selectSendGrades(user_id);
	}

	@Override
	public List<Profileboard> selectReceiveGrades(String user_id) {
		return myMessageDAO.selectReceiveGrades(user_id);
	}


	@Override
	public int acceptMessage(String sender_id, String receiver_id) {
		return myMessageDAO.acceptMessage(sender_id, receiver_id);
		
	}

	@Override
	public int refuseMessage(String sender_id, String receiver_id) {
		return myMessageDAO.refuseMessage(sender_id, receiver_id);
	}
	
	@Override
	public int readMessage(String sender_id, String receiver_id) {
		return myMessageDAO.readMessage(sender_id, receiver_id);
		
	}

	@Override
	public String selectReceiveId(String receiver_nm) {
		return myMessageDAO.selectReceiveId(receiver_nm);
	}

	@Override
	public int deleteChat(String userId) {
		return myMessageDAO.deleteChat(userId);
	}

}
