package com.godsky.findlove.main.profileboard.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.profileboard.model.vo.Message;

@Repository("messageDAO")
public class MessageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int sendMessage(Message message) {
		return sqlSession.insert("message.sendMessage",message);
	}
	
	public List<Message> selectSendMessage(String senderId) {
		System.out.println(sqlSession.selectList("message.selectSendMessage", senderId));
		return sqlSession.selectList("message.selectSendMessage", senderId);
	}

	public List<Message> selectReceiverMessage(String user_id) {
		Map<String, Object> map = new HashMap<String, Object>();
	    map.put("user_id", user_id);
		return sqlSession.selectList("message.selectReceiverMessage", map);
	}
}
