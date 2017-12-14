package com.godsky.findlove.main.mymatchboard.model.service;

import java.util.List;

import com.godsky.findlove.main.profileboard.model.vo.Message;

public interface MymatchboardService {

	List<Message> selectSendMessage(String senderId);

	/*List<Message> selectReceiverMessage(String user_id);*/

}
