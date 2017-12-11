package com.godsky.findlove.main.profileboard.controller;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.godsky.findlove.main.msgchatboard.model.vo.Message;
import com.godsky.findlove.main.profileboard.model.service.MessageService;

/**
 * Handles requests for the application home page.
 */
@RestController
public class MessageController {

	public MessageController() {}
	
	@Resource(name="messageService")
	private MessageService messageService;
	
	@RequestMapping(value = "/messages/addMessage.do", method = RequestMethod.POST)
	public ResponseEntity<String> addMessage(@RequestBody Message message){
		ResponseEntity<String> entity = null;
		
        try {
        	messageService.addMessage(message);
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return entity;
	}
}
