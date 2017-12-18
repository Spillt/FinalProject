package com.godsky.findlove.main.mymatchboard.model.service;

import java.util.List;

import com.godsky.findlove.main.mymatchboard.model.vo.MyMessage;

public interface MymatchboardService {

	List<MyMessage> selectSendMessages(String sender_id);

	/*List<Message> selectReceiverMessage(String user_id);*/

}
