package com.godsky.findlove.main.eventboard.percent.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.eventboard.percent.model.dao.PercentDao;
import com.godsky.findlove.main.eventboard.percent.model.vo.Percent;

@Service("PercentService")
public class PercentServiceImpl implements PercentService {

	@Autowired
	PercentDao percentDao;

/*	@Override
	public String selectUserName(String userId) {
		// TODO Auto-generated method stub
		return  percentDao.percentname(userId);
	}*/

	@Override
	public List<Percent> list(String userId) {
		// TODO Auto-generated method stub
		return percentDao.list(userId);
	}



	
}
