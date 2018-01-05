package com.godsky.findlove.main.matchboard.iwc.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.godsky.findlove.main.matchboard.iwc.model.vo.Iwc;

@Repository("iwcDao")
public class IwcDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Iwc> selectInitIwcList(Map<String, Object> map) {
		return sqlSession.selectList("iwc.selectTwoInitIwc", map);
	}


}
