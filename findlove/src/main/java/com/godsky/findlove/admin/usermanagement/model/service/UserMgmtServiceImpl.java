package com.godsky.findlove.admin.usermanagement.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.admin.usermanagement.model.dao.UserMgmtDao;
import com.godsky.findlove.admin.usermanagement.model.vo.User;

@Service("userMgmtService")
public class UserMgmtServiceImpl implements UserMgmtService {
	
	@Autowired
	UserMgmtDao userMgmtDao;
	
	@Override
	public ArrayList<User> getUserList() {
		return userMgmtDao.getUserList();
	}
	@Override
	public User getUserDetail(User user) {
		return userMgmtDao.getUserDetail();
	}
	@Override
	public ArrayList<User> getSignupUserList() {
		return userMgmtDao.getSignupUserList();
	}
	@Override
	public int admitSignupUser(User user) {
		return userMgmtDao.admitSignupUser();
	}
	@Override
	public ArrayList<User> getReportUserList() {
		return userMgmtDao.getReportUserList();
	}
	@Override
	public int suspendUser(User user) {
		return userMgmtDao.suspendUser();
	}
	
}
