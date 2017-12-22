package com.godsky.findlove.admin.usermanagement.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.admin.usermanagement.model.vo.UserBasic;
import com.godsky.findlove.admin.usermanagement.model.vo.UserDetail;
import com.godsky.findlove.admin.usermanagement.model.vo.UserMgmt;
import com.godsky.findlove.common.model.vo.Profile;
import com.godsky.findlove.common.model.vo.Report;
import com.godsky.findlove.common.model.vo.User;

@Repository("userMgmtDao")
public class UserMgmtDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getUserAllCnt() {
		return sqlSession.selectOne("userMgmt.selectUserAllCnt");
	}
	public List<UserBasic> getUserList(int startIdx, int lastIdx) {
		Map<String, Integer> idxMap = new HashMap<String, Integer>();
		idxMap.put("startIdx", startIdx);
		idxMap.put("lastIdx", lastIdx);
		return sqlSession.selectList("userMgmt.selectUserList", idxMap);
	}
	public UserDetail getUserDetail(String userId) {
		return sqlSession.selectOne("userMgmt.selectUserDetail", userId);
	}
	public Profile getUserProfile(String userId) {
		return sqlSession.selectOne("userMgmt.selectUserProfile", userId);
	}
	public List<String> getUserPictureList(String userId) {
		return sqlSession.selectList("userMgmt.selectUserPictureList", userId);
	}


	public int getWaitCnt() {
		return sqlSession.selectOne("userMgmt.selectWaitCnt");
	}
	public List<UserBasic> getSignupWaitList() {
		return sqlSession.selectList("userMgmt.selectSignupWaitList");
	}

	public int admitSignupUser(String userId) {
		return sqlSession.update("userMgmt.updateSignupWait", userId);
	}
	
	public int getReportCnt() {
		return sqlSession.selectOne("userMgmt.selectReportCnt");
	}
	public List<Report> getReportList() {
		return sqlSession.selectList("userMgmt.selectReportList");
	}

	public int updateReportState(int reportNo, boolean reportST) {
		int result;
		if(reportST)
			result = sqlSession.update("userMgmt.updateReportComplete", reportNo);
		else
			result = sqlSession.update("userMgmt.updateReportHold", reportNo);
		return result;
	}
	public int suspendUser(int reportNo) {
		return sqlSession.update("userMgmt.updateUserSuspend", reportNo);
	}
	

}
