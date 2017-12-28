package com.godsky.findlove.main.profileboard.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.profileboard.model.dao.KonpeitoDAO;
import com.godsky.findlove.main.profileboard.model.service.KonpeitoService;
import com.godsky.findlove.main.profileboard.model.service.MessageService;
import com.godsky.findlove.main.profileboard.model.vo.Message;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MessageController {

	public MessageController() {}
	
	@Resource(name="messageService")
	private MessageService messageService;
	
	@Resource(name="konpeitoService")
	private KonpeitoService konpeitoService;
	
	/*ajax로 실행될 메소드*/
	@RequestMapping("/message/sendMessage.do")
	public void sendMessage(ModelAndView mv, HttpServletResponse response, @RequestParam("sender")String sender, @RequestParam("reciever")String reciever, @RequestParam("message")String content) {
		Message message = new Message(sender, reciever, content);
		System.out.println(message);
		
		
		int point = konpeitoService.checkpoint(sender);
		
		if(point == 1) {
			int result = messageService.sendMessage(message);
			
			try {
		        response.getWriter().print(result);
		    } catch (IOException e) {
		        e.printStackTrace();
		    } 
		}

	}
	
}
