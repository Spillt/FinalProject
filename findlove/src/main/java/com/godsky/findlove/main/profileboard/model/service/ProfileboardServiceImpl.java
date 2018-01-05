package com.godsky.findlove.main.profileboard.model.service;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.profileboard.model.dao.ProfileDAO;
import com.godsky.findlove.main.profileboard.model.vo.Profileboard;

@Service("profileboardService")
public class ProfileboardServiceImpl implements ProfileboardService{
	
	@Resource(name="profileDAO")
    private ProfileDAO profileDAO;

	@Override
	public int countProfileList(String searchOption, String keyword) throws Exception {
		return profileDAO.countProfileList(searchOption, keyword);
	}
	
	@Override
	public List<Profileboard> selectProfileList(int start, int end, String searchOption, String keyword) throws Exception {
		return profileDAO.selectProfileList(start, end, searchOption, keyword);
	}

	@Override
	public Profileboard selectProfileDetail(String user_nicknm) throws Exception {
		return profileDAO.selectProfileDetail(user_nicknm);
	}

	@Override
	public List<String> selectProfileImage(String user_nicknm) throws Exception {
		return profileDAO.selectProfileImage(user_nicknm);
	}

	
	
}
