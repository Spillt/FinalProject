package com.godsky.findlove.main.profileboard.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.profileboard.model.vo.Message;

@Repository("messageDAO")
public class MessageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	public int sendMessage(Message message) {
		return sqlSession.insert("message.sendMessage", message);
	}


	public List<Message> selectSendMessage(String senderId) {
		return sqlSession.selectList("message.selectMessageList",senderId);
	}
	
}
