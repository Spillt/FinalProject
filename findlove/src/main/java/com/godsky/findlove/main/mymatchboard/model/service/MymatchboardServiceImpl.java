package com.godsky.findlove.main.mymatchboard.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.godsky.findlove.main.mymatchboard.model.dao.MyMessageDAO;
import com.godsky.findlove.main.mymatchboard.model.vo.MyMessage;
import com.godsky.findlove.main.profileboard.model.vo.Profileboard;

@Service("mymatchboardService")
public class MymatchboardServiceImpl implements MymatchboardService{

	@Resource(name="myMessageDAO")
    private MyMessageDAO myMessageDAO;
	
	@Override
	public List<MyMessage> selectSendMessages(String sender_id) {
		return myMessageDAO.selectSendMessages(sender_id);
	}

	@Override
	public List<Profileboard> selectSendGrades(String sender_id) {
		return myMessageDAO.selectSendGrades(sender_id);
	}

	

}
