package com.godsky.findlove.main.chatboard.modal.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.chatboard.modal.vo.Chat;
import com.godsky.findlove.user.model.vo.User;

@Repository("chatDAO")
public class ChatDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Chat> selectChatList(String user_id) {
		return sqlSession.selectList("chat.selectChatList", user_id);
	}

	public int insertChat(String userId, String matchingId) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("userId", userId);
		paramMap.put("matchingId", matchingId);
		return sqlSession.insert("chat.insertChat", paramMap);
	}

	public int checkChatStatus(User user) {
		return sqlSession.selectOne("chat.checkChatStatus", user);
	}

}
