package com.godsky.findlove.admin.usermanagement.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.admin.usermanagement.model.dao.UserMgmtDao;
import com.godsky.findlove.admin.usermanagement.model.vo.UserBasic;
import com.godsky.findlove.admin.usermanagement.model.vo.UserDetail;
import com.godsky.findlove.admin.usermanagement.model.vo.UserMgmt;
import com.godsky.findlove.common.model.vo.Profile;
import com.godsky.findlove.common.model.vo.Report;
import com.godsky.findlove.common.model.vo.User;

@Service("userMgmtService")
public class UserMgmtServiceImpl implements UserMgmtService {
	
	@Autowired
	UserMgmtDao userMgmtDao;
	
	@Override
	public int getUserAllCnt() {
		return userMgmtDao.getUserAllCnt();
	}
	@Override
	public List<UserBasic> getUserList(int startIdx, int lastIdx) {
		return userMgmtDao.getUserList(startIdx, lastIdx);
	}
	@Override
	public UserDetail getUserDetail(String userId) {
		return userMgmtDao.getUserDetail(userId);
	}
	@Override
	public Profile getUserProfile(String userId) {
		return userMgmtDao.getUserProfile(userId);
	}
	@Override
	public List<String> getUserPictureList(String userId) {
		return userMgmtDao.getUserPictureList(userId);
	}
	
	@Override
	public int getWaitCnt() {
		return userMgmtDao.getWaitCnt();
	}
	@Override
	public List<UserBasic> getSignupWaitList() {
		return userMgmtDao.getSignupWaitList();
	}
	
	@Override
	public int admitSignupUser(String userId) {
		return userMgmtDao.admitSignupUser(userId);
	}
	
	@Override
	public int getReportCnt() {
		return userMgmtDao.getReportCnt();
	}
	@Override
	public List<Report> getReportList() {
		return userMgmtDao.getReportList();
	}
	@Override
	public int completeReport(int reportNo) {
		return userMgmtDao.updateReportState(reportNo, true);
	}
	@Override
	public int suspendUser(int reportNo) {
		return userMgmtDao.suspendUser(reportNo);
	}
	@Override
	public int holdReport(int reportNo) {
		return userMgmtDao.updateReportState(reportNo, false);
	}
	
	
}
