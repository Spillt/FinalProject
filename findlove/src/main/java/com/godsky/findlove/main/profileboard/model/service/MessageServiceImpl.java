package com.godsky.findlove.main.profileboard.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.godsky.findlove.main.profileboard.model.dao.KonpeitoDAO;
import com.godsky.findlove.main.profileboard.model.dao.MessageDAO;
import com.godsky.findlove.main.profileboard.model.vo.Message;

@Service("messageService")
public class MessageServiceImpl implements MessageService{

	@Resource(name="messageDAO")
    private MessageDAO messageDAO;
	
	@Resource(name="konpeitoDAO")
    private KonpeitoDAO konpeitoDAO;

	@Override
	public int sendMessage(Message message) {
		return (messageDAO.sendMessage(message) & konpeitoDAO.minusPoint(message.getSender_id(), 10));
	}
}
