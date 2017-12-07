package com.godsky.findlove.main.matchboard.Idealworldcup.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.matchboard.Idealworldcup.model.vo.IdealWorldCup;

@Repository("IWCDao")
public class IWCDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public IdealWorldCup idealWorldCup(){
		return null;
	}
	public String logincheck() {
		return null;
	}
	public String gender(){
		return null;
	}
	public String updateiwc(){
		return null;
	}
	public String random(){
		return null;
	}
}
