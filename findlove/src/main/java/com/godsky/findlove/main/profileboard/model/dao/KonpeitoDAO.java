package com.godsky.findlove.main.profileboard.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("konpeitoDAO")
public class KonpeitoDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int minusPoint(String senderId, int point) {
		 Map<String, Object> map = new HashMap<String, Object>();
	     map.put("senderId", senderId);
	     map.put("point", point);
	     return sqlSession.update("konpeito.updateKonpeito", map);
	}

	public int checkpoint(String senderId) {
		return sqlSession.selectOne("konpeito.checkpoint", senderId);
	}

}
