package com.godsky.findlove.admin.usermanagement.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.admin.usermanagement.model.vo.User;

@Repository("userMgmtDao")
public class UserMgmtDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<User> getUserList() {
		return null;
	}

	public User getUserDetail() {
		return null;
	}

	public ArrayList<User> getSignupUserList() {
		return null;
	}

	public int admitSignupUser() {
		return 0;
	}

	public ArrayList<User> getReportUserList() {
		return null;
	}

	public int suspendUser() {
		return 0;
	}

}
