package com.godsky.findlove.common.session;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;

import com.godsky.findlove.user.model.service.UserService;

public class sessionStatusListener implements HttpSessionListener {	
	
	@Autowired
	private UserService userService;
	
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		HttpSession session = arg0.getSession();
		session.setMaxInactiveInterval(60*30);//초단위로 세션유지 시간을 설정합니다
		System.out.println(session.getId()+": 세션이 생성되었습니다.");
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		HttpSession session = arg0.getSession();
		System.out.println(session.getId()+": 세션이 삭제되었습니다.");
		int result = userService.checkSession(arg0.getSession().getId());
		if(result>0){
			userService.deleteSession(arg0.getSession().getId());
		}		
	}

}
