package com.godsky.findlove.main.mymatchboard.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.godsky.findlove.main.profileboard.model.dao.MessageDAO;
import com.godsky.findlove.main.profileboard.model.vo.Message;

@Service("mymatchboardService")
public class MymatchboardServiceImpl implements MymatchboardService{

	@Resource(name="messageDAO")
    private MessageDAO messageDAO;
	
	@Override
	public List<Message> selectSendMessage(String senderId) {
		return messageDAO.selectSendMessage(senderId);
	}

	/*@Override
	public List<Message> selectReceiverMessage(String user_id) {
		return messageDAO.selectReceiverMessage(user_id);
	}*/

}
