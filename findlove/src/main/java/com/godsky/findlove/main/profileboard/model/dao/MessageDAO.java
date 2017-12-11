package com.godsky.findlove.main.profileboard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.msgchatboard.model.vo.Message;

@Repository("messageDAO")
public class MessageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void create(Message message) {
		sqlSession.insert("message.create", message);
		
	}

}
