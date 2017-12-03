package com.godsky.findlove.user.model.service;

import com.godsky.findlove.user.model.vo.User;

public interface UserService {

	User loginCheck();

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


	
	
	

}
