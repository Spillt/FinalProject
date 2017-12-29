package com.godsky.findlove.main.inq.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("InqDao")
public class InqDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectInqList(Map<String, Object> map) throws Exception{
		return sqlSession.selectList("inq.selectInqList");
	}
}
