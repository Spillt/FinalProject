package com.godsky.findlove.main.mymatchboard.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.mymatchboard.model.vo.MyMessage;
import com.godsky.findlove.main.profileboard.model.vo.Profileboard;


@Repository("myMessageDAO")
public class MyMessageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<MyMessage> selectSendMessages(String user_id) {
		return sqlSession.selectList("mymessage.sendMessageList", user_id);
	}
	
	public List<MyMessage> selectReceiveMessages(String user_id) {
		return sqlSession.selectList("mymessage.receiveMessageList", user_id);
	}

	public void agreeMessage(String user_id) {
		sqlSession.update("mymessage.agreeMessage", user_id);
	}
	
	public List<Profileboard> selectSendGrades(String user_id) {
		return sqlSession.selectList("profile.sendGradeList", user_id);
	}

	public List<Profileboard> selectReceiveGrades(String user_id) {
		return sqlSession.selectList("profile.receiveGradeList", user_id);
	}

	public List<Profileboard> selectSendProfile(String user_id) {
		return sqlSession.selectList("profile.selectSendProfile", user_id);
	}

	public int acceptMessage(String sender_id, String receiver_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("sender_id", sender_id);
		map.put("receiver_id", receiver_id);
		
		return sqlSession.update("mymessage.acceptMessage", map);
	}

	public int refuseMessage(String sender_id, String receiver_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("sender_id", sender_id);
		map.put("receiver_id", receiver_id);
		
		return sqlSession.update("mymessage.refuseMessage", map);
	}
	
	public int readMessage(String sender_id, String receiver_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("sender_id", sender_id);
		map.put("receiver_id", receiver_id);
		
		return sqlSession.update("mymessage.readMessage", map);
	}

	public String selectReceiveId(String user_nicknm) {
		System.out.println("usernm"+user_nicknm);
		return sqlSession.selectOne("user.selectId", user_nicknm);
	}

	public int deleteChat(String userId) {
		return sqlSession.update("chat.deleteChat", userId);
	}


}
