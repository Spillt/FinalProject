package com.godsky.findlove.user.model.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.common.model.vo.Profile;
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
			session.setAttribute("user_id", vo2.getUser_id());
			session.setAttribute("user_nm", vo2.getUser_nm());
			session.setAttribute("user_nicknm", vo2.getUser_nicknm());
			session.setAttribute("konpeito_cnt",vo2.getKonpeito_cnt() );
		}
		System.out.println("result :" + result);
		
		return result;
		
	}
	
	
	@Override
	//로그 아웃
	public void logout(HttpSession session){
		//세션 개별 변수 삭제
		//session.removeAttrbute("userId");
		//세션 정보 초기화
		session.invalidate();
	}

	
	@Override
	//회원 상태 변경
	public int changeUserState(){
		return 0;
		
	}	
	
	
	@Override
	//이상형 프로필 생성
	public int createIdealProfile(){
		return 0;
		
	}

	@Override
	//로그인 정보 보기
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
	public int signUp(User user) {
		return userDao.signUp(user);
	}

	@Override
	//회원 계정 찾기
	public User findAccount(String email) {
		return userDao.findAccount(email);
	}

	@Override
	//내정보 보기
	public User myInfo(String user_id) {
		return userDao.myInfo(user_id);
		
	}
	
	@Override
	//내 정보 수정
	public void myInfoSet(User user) {
		userDao.myInfoSet(user);
	}

	@Override
	//내 프로필 보기
	public Profile myProfile(String user_id) {		
		return userDao.myProfile(user_id);
	}
	
	@Override
	//내 프로필 수정
	public void myProfileSet(Profile profile) {
		userDao.myProfileset(profile);
		
	}


	@Override
	//내 정보 수정(메일용)
	public User myInfoSet(String user_id, String string, String user_pwd) {
		// TODO Auto-generated method stub
		return null;
	}
	

	//이상형 프로필 보기
	@Override
	public Profile idealProfile(String user_id) {		
		return userDao.idealProfile(user_id);
	}
	
	@Override
	//회원 삭제
	public void removeUserById(String user_id){
		int cnt = userDao.removeUserById(user_id);
		System.out.println(cnt + "개의 행이 삭제되었습니다.");
		
	}


	@Override
	public void deleteSession(String session_key) {
		userDao.deleteSession(session_key);
	}


	@Override
	public void insertSession(String session_key, String userId) {
		userDao.insertSession(session_key,userId);
	}


	@Override
	public int checkSession(String session_key) {
		return userDao.checkSession(session_key);
	}


	@Override
	public int loginCount() {
		return userDao.loginCount();
	}


	@Override
	public List<String> userList() {
		return userDao.userList();
	}


	


	



	

}
