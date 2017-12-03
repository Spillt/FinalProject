package com.godsky.findlove.main.msgchatboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MsgchatboardController {
	@Autowired
	private MsgchatboardController msgchatboardController;
	
	public MsgchatboardController() {}
	
	//내가 호감을 보낸 이성 리스트 페이지 이동
	@RequestMapping(value = "senderList.do")
	public String senderList(){
		return null;		
	}
	
	//나애게 호감을 보낸 이성 리스트 페이지 이동
	@RequestMapping(value = "receiverList.do")
	public String receiverList(){
		return null;		
	}
	
	//프로필 상세 페이지 이동
	@RequestMapping(value = "profiledetail.do")
	public String selectProfile(){
		return null;		
	}
}
