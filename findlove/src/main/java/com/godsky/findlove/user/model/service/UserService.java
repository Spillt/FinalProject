package com.godsky.findlove.user.model.service;

import javax.servlet.http.HttpSession;

import com.godsky.findlove.common.model.vo.Profile;
import com.godsky.findlove.user.model.vo.User;

public interface UserService {
	
	//로그인 체크
	public boolean loginCheck(User vo, HttpSession session);

	//회원 로그인 정보
	public User viewMember(User vo);
	
	//회원 로그아웃
	public void logout(HttpSession session);
	
	//회원 생성
	public int signUp(User user);
	

	int changeUserState();

	int createIdealProfile();

	public int idCheck(String userId);
	
	//회원 계정 찾기
	public User findAccount(String email);
	
	//내정보 보기
	public User myInfo(String user_id);
	
	//내정보 수정(메일)
	public User myInfoSet(String user_id, String string, String user_pwd);
	
	//내정보 수정 처리
	public void myInfoSet(User user);
	
	//회원 탈퇴
	public void removeUserById(String user_id);

	//내 프로필 보기
	public Profile myProfile(String user_id);
	
	//내 프로필 수정 처리
	public void myProfileSet(Profile profile);
	
	//이성 프로필 보기
	public Profile idealProfile(String user_id);
	
	

	

	

}
