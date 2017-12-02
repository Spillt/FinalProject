package com.godsky.findlove.admin.usermanagement.model.service;

import java.util.ArrayList;

import com.godsky.findlove.admin.usermanagement.model.vo.User;

public interface UserMgmtService {

	ArrayList<User> getUserList();
	User getUserDetail(User user);
	ArrayList<User> getSignupUserList();
	int admitSignupUser(User user);
	ArrayList<User> getReportUserList();
	int suspendUser(User user);

}
