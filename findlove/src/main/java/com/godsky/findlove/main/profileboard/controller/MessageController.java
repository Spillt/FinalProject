package com.godsky.findlove.main.profileboard.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	@RequestMapping("/sendMessage.do")
	public void sendMessage(HttpServletResponse response, @RequestParam("sender")String sender, @RequestParam("reciever")String reciever, @RequestParam("message")String content) {
		Message message = new Message(sender, reciever, content);
		System.out.println(message);
		
		//사용자당 한번만 메세지 보내기 가능
		int check = messageService.checkMessage(message);
		System.out.println("확인용"+check);
		
		
		if(check < 1) {
		//별사탕이 10보다 많은지 확인 -> 많으면 1출력, 부족하면 0출력
		int point = konpeitoService.checkpoint(sender);
		System.out.println(point);
		
			if(point == 1) { //별사탕이 10보다 많을 때 
				int result = messageService.sendMessage(message);
				
				try {
			        response.getWriter().print(result); //메세지성공1출력
			    } catch (IOException e) {
			        e.printStackTrace();
			    } 
			}else { //별사탕이 10보다 작을 떄
				
				try {
			        response.getWriter().print(point); //별사탕부족0출력
			    } catch (IOException e) {
			        e.printStackTrace();
			    } 
			}
		}else {
			try {
		        response.getWriter().print(2); //중복2출력
		    } catch (IOException e) {
		        e.printStackTrace();
		    } 
		}
		
	}
}
