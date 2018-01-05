package com.godsky.findlove.main.chatboard.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.godsky.findlove.main.chatboard.modal.service.ChatboardService;
import com.godsky.findlove.main.mymatchboard.model.service.MymatchboardService;

public class EchoHandler extends TextWebSocketHandler {

	Map<String, WebSocketSession> sessions;
	
	@Resource(name="mymatchboardService")
	private MymatchboardService mymatchboardService;
	
	public EchoHandler() {
	// 1대1일 채팅 map 사용
	sessions = new HashMap<String, WebSocketSession>();

	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId() + "연결됨 채팅방 입장");
		sessions.put(session.getId(), session);
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.printf("%s로부터 [%s] 받음\n", session.getId(), message.getPayload());
		
		Map<String,Object> map = session.getAttributes();
		  String userId = (String)map.get("user_id");
		  System.out.println("로그인 한 아이디 : " + userId);
		  
		  
		Iterator<String> sessionIds = sessions.keySet().iterator();
		String sessionId = "";
		while (sessionIds.hasNext()) {
			sessionId = sessionIds.next();
			
			String time = new SimpleDateFormat("HH:mm").format(new Date());
			sessions.get(sessionId).sendMessage(new TextMessage(userId + "|" + message.getPayload() + "|" + time));
			//sessions.get(sessionId).sendMessage(new TextMessage(userId + "|" + message.getPayload()));
			//채팅방에 들어온 모든 세션아이디를 받아옴
			System.out.println(sessionId);
		}

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.printf("%s 연결 끊김\n", session.getId());
		
		Map<String,Object> map = session.getAttributes();
		  String userId = (String)map.get("user_id");
		  System.out.println("로그인 한 아이디 : " + userId);
		  
		  mymatchboardService.deleteChat(userId);
		  
		sessions.remove(session.getId());
	}
}
