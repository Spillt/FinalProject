package com.godsky.findlove.main.profileboard.controller;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import com.godsky.findlove.main.profileboard.model.service.MessageService;
import com.godsky.findlove.main.profileboard.model.vo.Message;

/**
 * Handles requests for the application home page.
 */
@RestController
public class MessageController {

	public MessageController() {}
	
	@Resource(name="messageService")
	private MessageService messageService;

	
	/*ajax로 실행될 메소드*/
	@RequestMapping("sendMessage.do")
	public ResponseEntity<String> sendMessage(@RequestParam("sender_id")String sender_id, @RequestParam("reciever_id")String reciever_id, @RequestParam("message_content")String message_content) {
		Message message = new Message(sender_id, reciever_id, message_content);
		System.out.println(message);
		
		ResponseEntity<String> entity = null;
		
		try {
			messageService.sendMessage(message);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		System.out.println(entity);
		return entity;
		
	}
}
