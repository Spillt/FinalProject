package com.godsky.findlove.main.chatboard.modal.service;

import java.util.List;

import com.godsky.findlove.main.chatboard.modal.vo.Chat;
import com.godsky.findlove.user.model.vo.User;

public interface ChatboardService {

	List<Chat> selectChatList(String user_id);

	int insertChat(String userId, String matchingId);

	int checkChatStatus(User user);


}
