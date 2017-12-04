package com.godsky.findlove.main.profileboard.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.godsky.findlove.user.model.vo.Profile;

@Repository("profileboardDao")
public class ProfileboardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount() {
		return 0;
	}

	public ArrayList<Profile> selectList() {
		return null;
	}

	public Profile selectProfile() {
		return null;
	}

	public int reportProfile() {
		return 0;
	}

	public int sendMessage() {
		return 0;
	}
}
