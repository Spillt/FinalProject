package com.godsky.findlove.main.mymatchboard.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.mymatchboard.model.vo.MyMessage;
import com.godsky.findlove.main.profileboard.model.vo.Profileboard;


@Repository("myMessageDAO")
public class MyMessageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<MyMessage> selectSendMessages(String sender_id) {
		return sqlSession.selectList("mymessage.sendMessageList", sender_id);
	}

	public List<Profileboard> selectSendGrades(String sender_id) {
		return sqlSession.selectList("profile.sendGradeList", sender_id);
	}
}
