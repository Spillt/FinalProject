package com.godsky.findlove.user.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.common.model.vo.Profile;
import com.godsky.findlove.main.eventboard.poll.model.vo.Poll;
import com.godsky.findlove.user.model.vo.User;

@Repository("userDao")
public class UserDao {

	@Autowired
	private SqlSession sqlSession;

	// 로그인 체크
	public boolean loginCheck(User vo) {
		System.out.println(vo);
		String name = sqlSession.selectOne("user.loginCheck", vo);
		System.out.println("name : " + name);
		return (name == null) ? false : true;
	}

	// 로그인 정보 보기
	public User viewMember(User vo) {
		return sqlSession.selectOne("user.viewMember", vo);
	}

	// 로그아웃
	public void logout(HttpSession session) {
	}

	// 회원 생성
	public int signUp(User vo) {
		System.out.println("dao");
		return sqlSession.insert("user.insertUser", vo);
	}

	public int changeUserState() {
		return 0;
	}

	public int createIdealProfile() {
		return 0;

	}

	// 내 정보 보기
	public User myInfo(String user_id) {
		return sqlSession.selectOne("user.myinfo", user_id);
	}

	// 내정보 수정
	public int myInfoSet(User user) {
		System.out.println("내 정보 수정 dao");
		return sqlSession.update("user.myinfoset", user);

	}

	// 아이디 중복 체크
	public int idCheck(String userId) {
		return sqlSession.selectOne("user.idCheck", userId);
	}

	// 계정 찾기
	public User findAccount(String email) {
		return sqlSession.selectOne("user.findAccount", email);
	}

	// 회원 탈퇴
	public int removeUserById(String user_id) {
		return sqlSession.delete("removeUserById", user_id);
	}

	// 내 프로필 보기
	public Profile myProfile(String user_id) {
		return sqlSession.selectOne("profile.myprofile", user_id);
	}
	
	//내 프로필 수정
	public int myProfileset(Profile profile) {
		System.out.println("내 프로필 수정 dao");
		return sqlSession.update("profile.myprofileset",profile);
		
	}
	
	// 이상형 프로필 보기
	public Profile idealProfile(String user_id) {		
		return sqlSession.selectOne("profile.idealprofile", user_id);
	}

	public void insertSession(String session_key, String userId) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("session_key",session_key);
		map.put("user_id",userId);
		sqlSession.insert("user.insertSession", map);
	}

	public void deleteSession(String session_key) {
		sqlSession.delete("user.deleteSession", session_key);
	}

	public int checkSession(String session_key) {
		return sqlSession.selectOne("user.checkSession", session_key);
	}

	public int loginCount() {
		return sqlSession.selectOne("user.loginCount");
	}

	public List<String> userList() {
		return sqlSession.selectList("user.userList");
	}


}
