package com.godsky.findlove.main.chatboard.modal.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.godsky.findlove.main.chatboard.modal.dao.ChatDAO;
import com.godsky.findlove.main.chatboard.modal.vo.Chat;
import com.godsky.findlove.user.model.vo.User;

@Service("chatboardService")
public class ChatboardServiceImpl implements ChatboardService{
	
	@Resource(name="chatDAO")
	private ChatDAO chatDAO;

	@Override
	public List<Chat> selectChatList(String user_id) {
		return chatDAO.selectChatList(user_id);
	}

	@Override
	public int insertChat(String userId, String matchingId) {
		return chatDAO.insertChat(userId,matchingId);
	}

	@Override
	public int checkChatStatus(User user) {
		return chatDAO.checkChatStatus(user);
	}
	
	

}
