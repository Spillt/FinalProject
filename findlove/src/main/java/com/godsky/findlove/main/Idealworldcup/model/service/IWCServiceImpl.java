package com.godsky.findlove.main.Idealworldcup.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.Idealworldcup.controller.IWCController;
import com.godsky.findlove.main.Idealworldcup.model.dao.IWCDao;
import com.godsky.findlove.main.Idealworldcup.model.vo.IdealWorldCup;

@Service("IWCService")
public class IWCServiceImpl implements IWCService{
	@Autowired
	IWCDao IWCDao;
	IdealWorldCup IdealWorldCup;
	
	public String idealWorldCup() {
		// 페이지
		IWCDao.idealWorldCup();
		return "idealworldcup.do";
	}
	public String logincheck() {
		// 로그인
		IWCDao.logincheck();
		return IWCController.logincheck();
	}
	public String gender() {
		// 성별확인
		IWCDao.logincheck();
		return "gender.do";
	}
	public String updateiwc() {
		// 업데이트
		IWCDao.logincheck();
		return "updateiwc.do";
	}
	public String random() {
		// 랜덤
		IWCDao.logincheck();
		return "random.do";
	}
}
