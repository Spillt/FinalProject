package com.godsky.findlove.main.profileboard.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.godsky.findlove.main.msgchatboard.model.vo.Message;
import com.godsky.findlove.main.profileboard.model.dao.MessageDAO;
import com.godsky.findlove.main.profileboard.model.dao.PointDAO;

@Service("messageService")
public class MessageServiceImpl implements MessageService{

	@Resource(name="messageDAO")
    private MessageDAO messageDAO;
	
	@Resource(name="pointDAO")
    private PointDAO pointDAO;
	
	@Override
	public void addMessage(Message message) {

		messageDAO.create(message);
		pointDAO.update(message.getSenderId(), 10);
      
	}
}
