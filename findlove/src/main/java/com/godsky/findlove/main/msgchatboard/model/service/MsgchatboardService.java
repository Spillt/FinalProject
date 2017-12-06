package com.godsky.findlove.main.msgchatboard.model.service;

import java.util.*;
import com.godsky.findlove.main.msgchatboard.model.vo.Message;
import com.godsky.findlove.user.model.vo.Profile;

public interface MsgchatboardService {
	
	ArrayList<Message> senderList();
	
	ArrayList<Message> receiverList();
	
	Profile selectProfile();
	
	
}
