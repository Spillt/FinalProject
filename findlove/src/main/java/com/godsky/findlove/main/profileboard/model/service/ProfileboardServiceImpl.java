package com.godsky.findlove.main.profileboard.model.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.godsky.findlove.main.profileboard.model.dao.ProfileDAO;

@Service("profileboardService")
public class ProfileboardServiceImpl implements ProfileboardService{
	
	@Resource(name="profileDAO")
    private ProfileDAO profileDAO;

	@Override
	public List<Map<String, Object>> selectProfileList(Map<String, Object> map) throws Exception {
		return profileDAO.selectProfileList(map);
	}
	
}
