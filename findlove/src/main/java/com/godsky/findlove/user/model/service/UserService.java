package com.godsky.findlove.user.model.service;

import javax.servlet.http.HttpSession;

import com.godsky.findlove.user.model.vo.User;

public interface UserService {
	
	//01-1 로그인 체크
	public boolean loginCheck(User vo, HttpSession session);
	
	//01-2 로그인 정보
	public User viewUser(User vo);
	
	//01-3 로그아웃
	public void logout(HttpSession session);
	
	//02 회원 가입
	public int insert(User vo);
	
	int checkEmail();

	int checkName();

	int checkNickName();

	int checkPwd();

	String sendNewPwd();

	String randomCreatePwd();

	int modifyPwd();

	int changeUserState();

	int updateUserInfo();

	int createUserProfile();

	int createIdealProfile();


	
	
	

}
