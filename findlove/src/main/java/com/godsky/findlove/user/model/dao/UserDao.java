package com.godsky.findlove.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.user.model.vo.User;

@Repository("userDao")
public class UserDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public User selectUser(User vo){
		return sqlSession.selectOne("user.selectUser", vo);
		}
	
	public boolean creatUser(){
		return false;
		
	}
	
	public int checkEmail(){
		return 0;		
	}
	
	public int checkName(){
		return 0;		
	}
	
	public int checkNickName(){
		return 0;
		
	}
	
	public int checkPwd(){
		return 0;
	}
	
	public int modifyPwd(){
		return 0;
	}
	
	public int changeUserState(){
		return 0;
	}
	
	public int updateUserInfo(){
		return 0;
		
	}
	
	public int createUserProfile(){
		return 0;
	
	}
	
	public int createIdealProfile(){
		return 0;
		
	}

}
