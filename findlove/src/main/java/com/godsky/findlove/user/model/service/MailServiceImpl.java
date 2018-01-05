package com.godsky.findlove.user.model.service;

import org.springframework.stereotype.Service;

import java.io.File;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;


//MailService Interface
@Service("mailService")
public class MailServiceImpl implements MailService{
	
	private JavaMailSender javaMailSender;
	
	public void setJavaMailSender(JavaMailSender javaMailSender){
		this.javaMailSender = javaMailSender;
	}

	@Override
	public void send(String subject, String text, String from, String to) {
		//javax.mail.internet.MimeMessage
		MimeMessage message = javaMailSender.createMimeMessage();
		
		try {
			//org.springframework.mail.javamail.MimeMessageHelper
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setFrom(from);
			helper.setTo(to);
			helper.setSubject(subject);
			helper.setText(text, true);
			
			//첨부파일 처리
			/*if(filePath != null){
				File file = new File(filePath);
				if(file.exists()){
					helper.addAttachment(file.getName(), new File(filePath));
				}
				
			}*/
			javaMailSender.send(message);
			//return true;			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//return false;
	}

}
