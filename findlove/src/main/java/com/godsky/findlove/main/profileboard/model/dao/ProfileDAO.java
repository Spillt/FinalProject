package com.godsky.findlove.main.profileboard.model.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import com.godsky.findlove.common.dao.AbstractDAO;

@Repository("profileDAO")
public class ProfileDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProfileList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("profile.selectProfileList", map);
	}
}
