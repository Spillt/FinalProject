package com.godsky.findlove.main.mymatchboard.model.service;

import java.util.List;

import com.godsky.findlove.main.mymatchboard.model.vo.MyMessage;
import com.godsky.findlove.main.profileboard.model.vo.Profileboard;

public interface MymatchboardService {

	List<MyMessage> selectSendMessages(String user_id);
	
	List<MyMessage> selectReceiveMessages(String user_id);

	List<Profileboard> selectSendGrades(String user_id);

	List<Profileboard> selectReceiveGrades(String user_id);

	int acceptMessage(String sender_id, String receiver_id);
	
	int refuseMessage(String sender_id, String receiver_id);

	int readMessage(String sender_id, String receiver_id);

	String selectReceiveId(String receiver_nm);

	int deleteChat(String uesrId);


}
