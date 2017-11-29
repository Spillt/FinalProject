package com.godsky.findlove.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.user.model.dao.UserDao;
import com.godsky.findlove.user.model.vo.Profile;
import com.godsky.findlove.user.model.vo.User;

@Service("userService")
public class UserServiceImpl implements UserService{
	//dao 사용	
	@Autowired
	UserDao userDao;
	User user;
	Profile profile;
	
	@Override	
	//로그인
	public User loginCheck(){
		return userDao.selectUser();		
	}
	
	@Override
	//회원생성
	public boolean createUser(){
		return false;		
	}
	
	@Override
	//이메일 체크
	public int checkEmail(){
		return 0;
		
	}
	
	@Override
	//이름 체크
	public int checkName(){
		return 0;
		
	}
	
	@Override
	//닉네임 체크
	public int checkNickName(){
		return 0;
	}
	
	@Override
	//비밀번호 체크
	public int checkPwd(){
		return 0;
		
	}
	
	@Override
	//임시 비밀번호 발급
	public String sendNewPwd(){
		return null;
		
	}
	
	@Override
	//비밀번호 랜덤생성
	public String randomCreatePwd(){
		return null;
		
	}
	
	@Override
	//비밀번호 확인
	public int modifyPwd(){
		return 0;
		
	}
	
	@Override
	//회원 상태 변경
	public int changeUserState(){
		return 0;
		
	}
	
	@Override
	//회원 정보 업데이트
	public int updateUserInfo(){
		return 0;
		
	}
	
	@Override
	//유저 프로필 생성
	public int createUserProfile(){
		return 0;
		
	}
	
	@Override
	//이상형 프로필 생성
	public int createIdealProfile(){
		return 0;
		
	}	
	


}
