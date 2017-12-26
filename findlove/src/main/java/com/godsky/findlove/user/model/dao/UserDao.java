package com.godsky.findlove.user.model.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.eventboard.poll.model.vo.Poll;
import com.godsky.findlove.user.model.vo.User;

@Repository("userDao")
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//로그인 체크
	public boolean loginCheck(User vo){
		System.out.println(vo);
		String name = sqlSession.selectOne("user.loginCheck", vo);		
		System.out.println("name : " + name);
		return (name == null)? false : true;
		}
	
	/*public boolean loginCheck(User vo){
		int count = Integer.parseInt(sqlSession.selectOne("loginCheck", vo).toString()),
				totalCount = sqlSession.selectOne("totalAccount");
		
		if(totalCount >0){
			if(count > 0){
				return true;
			}else
				return false;
		}
		return false;
	}*/
	
	//로그인 정보
	public User viewMember(User vo){
		return sqlSession.selectOne("user.viewMember", vo);
	}
	
	//로그아웃
	public void logout(HttpSession session){}
	
	//회원 생성
	public int creatUser(User vo){
		System.out.println("dao");
		return sqlSession.insert("user.insertUser", vo);
	}
	

	
	public int changeUserState(){
		return 0;
	}
	
	
	public int createUserProfile(){
		return 0;
	
	}
	
	public int createIdealProfile(){
		return 0;
		
	}
	public User myInfoSet(String user_id) {
		return sqlSession.selectOne("user.myinfo",user_id);
	}
	
	//아이디 중복 체크
	public int idCheck(String userId) {
		return sqlSession.selectOne("user.idCheck", userId);
	}
	
	//계정 찾기
	public User findAccount(String email) {
		return sqlSession.selectOne("user.findAccount", email);
	}
	
	//회원 탈퇴
	public int removeUserById(String user_id) {
		return sqlSession.delete("removeUserById", user_id);
	}

}
