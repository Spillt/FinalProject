package com.godsky.findlove.user.model.service;

import javax.servlet.http.HttpSession;

import com.godsky.findlove.user.model.vo.User;

public interface UserService {
	
	//로그인 체크
	public boolean loginCheck(User vo, HttpSession session);

	//회원 로그인 정보
	public User viewMember(User vo);
	
	//회원 로그아웃
	public void logout(HttpSession session);
	
	//회원 가입
	public int insert(User user);
	
	
	boolean createUser();

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

	public int idCheck(String userId);
	
	//회원 계정 찾기
	public User findAccount(String email);
	
	//회원 정보 업데이트
	public void updateInfo(String userId, String string, String password);


	
	
	

}
