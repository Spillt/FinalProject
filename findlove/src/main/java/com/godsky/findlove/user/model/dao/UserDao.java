package com.godsky.findlove.user.model.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.user.model.vo.User;

@Repository("userDao")
public class UserDao {
	
	@Autowired
	private static SqlSession sqlSession;
	
	//로그인 체크
	public boolean loginCheck(User vo){
		String name = sqlSession.selectOne("user.loginCheck",vo);
		return(name == null)? false : true;
		}
	
	//로그인 정보
	public static User viewMember(User vo){
		return sqlSession.selectOne("user.viewMember", vo);
	}
	
	//로그아웃
	public void logout(HttpSession session){
		
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
