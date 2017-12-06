package com.godsky.findlove.main.msgchatboard.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.msgchatboard.model.vo.Message;
import com.godsky.findlove.user.model.vo.Profile;

@Repository("msgchatboardDao")
public class MsgchatboardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Message> senderList() {
		return null;
	}

	public ArrayList<Message> receiverList() {
		return null;
	}

	public Profile selectProfile() {
		return null;
	}

}
