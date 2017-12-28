package com.godsky.findlove.main.mymatchboard.model.service;

import java.util.List;

import com.godsky.findlove.main.mymatchboard.model.vo.MyMessage;
import com.godsky.findlove.main.profileboard.model.vo.Profileboard;

public interface MymatchboardService {

	List<MyMessage> selectSendMessages(String sender_id);

	List<Profileboard> selectSendGrades(String sender_id);

}
