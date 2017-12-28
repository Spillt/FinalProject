package com.godsky.findlove.main.matchboard.Idealworldcup.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.matchboard.Idealworldcup.controller.IWCController;
import com.godsky.findlove.main.matchboard.Idealworldcup.model.dao.IWCDao;
import com.godsky.findlove.main.matchboard.Idealworldcup.model.vo.IdealWorldCup;

@Service("IWCService")
public class IWCServiceImpl implements IWCService{
	@Autowired
	IWCDao IWCDao;
	IdealWorldCup IdealWorldCup;
	@Override
	public List<IdealWorldCup> list(String gender) {
		// TODO Auto-generated method stub
		return IWCDao.list(gender);
	}
	@Override
	public String selectUserGender(String userId) {
		// TODO Auto-generated method stub
		return IWCDao.selectUserGender(userId);
	}

}
