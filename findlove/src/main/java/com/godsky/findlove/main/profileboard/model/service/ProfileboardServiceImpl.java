package com.godsky.findlove.main.profileboard.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.profileboard.model.dao.ProfileboardDao;
import com.godsky.findlove.main.profileboard.model.vo.Message;
import com.godsky.findlove.main.profileboard.model.vo.Report;
import com.godsky.findlove.user.model.vo.Profile;

@Service("profileboardService")
public class ProfileboardServiceImpl implements ProfileboardService{
	
	//dao 사용	
	@Autowired
	ProfileboardDao profileboardDao;
	Profile profile;
	Report report;
	Message message;
	
	@Override
	//전체 프로필 갯수 조회
	public int getListCount() {
		return 0;
	}

	@Override
	//해당 페이지용 프로필 조회
	public ArrayList<Profile> selectList() {
		return null;
	}

	@Override
	//프로필 검색
	public ArrayList<Profile> selectSearch() {
		return null;
	}
	
	@Override
	//프로필 상세 조회
	public Profile selectProfile() {
		return null;
	}
	
	@Override
	//프로필 신고하기
	public int reportProfile() {
		return 0;
	}

	//호감 메시지 보내기
	@Override
	public int sendMessage() {
		return 0;
	}

}
