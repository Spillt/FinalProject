package com.godsky.findlove.main.profileboard.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("pointDAO")
public class PointDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void update(String senderId, int point_cnt) {
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("senderId", senderId);
        map.put("point", point_cnt);
        sqlSession.update("point.updatePoint", map);
		
	}

	public int minusPoint(String senderId, int point) {
		// TODO Auto-generated method stub
		return 0;
	}

}
