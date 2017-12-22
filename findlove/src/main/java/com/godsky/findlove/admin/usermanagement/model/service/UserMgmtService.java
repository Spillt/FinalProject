package com.godsky.findlove.admin.usermanagement.model.service;


import java.util.List;

import com.godsky.findlove.common.model.vo.Profile;
import com.godsky.findlove.common.model.vo.Report;
import com.godsky.findlove.admin.usermanagement.model.vo.UserBasic;
import com.godsky.findlove.admin.usermanagement.model.vo.UserDetail;


public interface UserMgmtService {
	
	int getUserAllCnt();

	List<UserBasic> getUserList(int startIdx, int lastIdx);
	UserDetail getUserDetail(String userId);
	Profile getUserProfile(String userId);
	List<String> getUserPictureList(String userId);
	
	int getWaitCnt();
	List<UserBasic> getSignupWaitList();
	int admitSignupUser(String userId);
	
	
	int getReportCnt();
	List<Report> getReportList();
	int completeReport(int reportNo);
	int suspendUser(int reportNo);
	int holdReport(int reportNo);

}
