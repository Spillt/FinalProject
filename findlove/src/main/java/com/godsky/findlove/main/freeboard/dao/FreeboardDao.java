package com.godsky.findlove.main.freeboard.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.freeboard.vo.Freeboard;

@Repository("FreeboardDao")
public class FreeboardDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFreeboardService(Map<String, Object> map) throws Exception{	
		return sqlSession.selectList("freeboard.selectFreeboardList");
	}

	public int insertFreeboard(Freeboard freeboard){
		return sqlSession.insert("freeboard.insertFreeboard");
	}

	

}
