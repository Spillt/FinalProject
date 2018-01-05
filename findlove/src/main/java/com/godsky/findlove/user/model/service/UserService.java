package com.godsky.findlove.user.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.godsky.findlove.common.model.vo.Profile;
import com.godsky.findlove.user.model.vo.Image;
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

	public int idDuplicatedCheck(User user);
	
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
	
	//이상형 프로필 수정 처리
	public void idealProfileSet(Profile profile);

	//세션 관리
	public int checkSession(String id);
	
	public void deleteSession(String session_key);

	public void insertSession(String session_key, String userId);

	public int loginCount();

	public List<String> userList();

	public String selectuser(String userId);

	public String loginUserCheck(String userId);

	public int checkId(User user);

	public int checkNicknm(User user);

	public int getPointCnt(String userId);

	public int getKonpeitoCnt(String userId);

	public List<Image> getImageList(String user_id);

	
	/*//로그인 2
	public User findByUserIdAndPwd(String user_id, String pwd);
	*/
	//결제 관련
	/*public User storeUser(String user_id);*/
	
	

	

	

}
