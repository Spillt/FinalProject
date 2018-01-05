package com.godsky.findlove.main.profileboard.model.dao;

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


	public int checkMessage(Message message) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("message.checkMessage", message);
	}
	
}
