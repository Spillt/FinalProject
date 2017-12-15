package com.godsky.findlove.user.model.service;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.user.model.dao.UserDao;
import com.godsky.findlove.user.model.vo.User;

@Service("userService")
public class UserServiceImpl implements UserService{
	//dao 사용	
	@Resource(name ="userDao")
	private UserDao userDao;	
		
	@Override	
	//로그인 체크
	public boolean loginCheck(User vo, HttpSession session){
		boolean result = userDao.loginCheck(vo);
		if(result){
			User vo2 = viewMember(vo);
			//세션 변수 등록
			session.setAttribute("userId", vo2.getUserId());
			session.setAttribute("userName", vo2.getUserName());
			session.setAttribute("userPwd", vo2.getUserPwd());
			session.setAttribute("userNickName", vo2.getUserNickName());
			session.setAttribute("konpeitoCNT", vo2.getKonpeitoCNT());
		}
		
		return result;
		
	}
	
/*	@Override
	//로그인 정보
	public User viewMember(User vo){
		return UserDao.viewMember(vo);
	}*/
	
	@Override
	//로그 아웃
	public void logout(HttpSession session){
		//세션 개별 변수 삭제
		//session.removeAttrbute("userId");
		//세션 정보 초기화
		session.invalidate();
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

	@Override
	//멤버 정보 보기
	public User viewMember(User vo) {
		return userDao.viewMember(vo);
	}

	@Override
	//아이디 중복 체크
	public int idCheck(String userId) {
		return userDao.idCheck(userId);
	}

	@Override
	//회원가입
	public int insert(User user) {
		return userDao.creatUser(user);
	}

	@Override
	//회원 계정 찾기
	public User findAccount(String email) {
		return userDao.findAccount(email);
	}

	@Override
	//회원 정보 업데이트
	public void updateInfo(String userId, String string, String password) {
		// TODO Auto-generated method stub
		
	}

	

}
