package com.godsky.findlove.admin.usermanagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.admin.usermanagement.model.service.UserMgmtService;
import com.godsky.findlove.common.model.vo.Profile;
import com.godsky.findlove.common.model.vo.Report;
import com.godsky.findlove.common.model.vo.User;
import com.godsky.findlove.admin.usermanagement.model.vo.UserBasic;
import com.godsky.findlove.admin.usermanagement.model.vo.UserDetail;
import com.godsky.findlove.admin.usermanagement.model.vo.UserMgmt;

@Controller
public class UserMgmtController {

	@Autowired
	private UserMgmtService userMgmtService;
	
	public UserMgmtController() {}
	
	/* 전체 회원 관리 */
	
	// 전체 회원 리스트 조회
	@RequestMapping(value="userlist.do")
	public String userList(@RequestParam("pageNo") int pageNo, Model model) {
		int userCnt = userMgmtService.getUserAllCnt();
		model.addAttribute("userAllCnt", userCnt);
		model.addAttribute("userWaitCnt", userMgmtService.getWaitCnt());
		model.addAttribute("reportCnt", userMgmtService.getReportCnt());
		
		int capacity = 5;
		int pageCnt = (int)(Math.ceil((double)userCnt/capacity));
		int startIdx = 1 + capacity*(pageNo-1);
		int lastIdx = startIdx + capacity - 1;
		if(pageNo == pageCnt) {
			lastIdx -= userCnt%capacity;
		}
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("list", userMgmtService.getUserList(startIdx, lastIdx));
		return "admin/user/userlist";
	}
	// 회원 상세 조회
	@RequestMapping(value="userdetail.do",  produces = "application/json; charset=utf8")
	public ModelAndView userDetail(@RequestParam("userId") String userId) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("userDetail", userMgmtService.getUserDetail(userId));
		mav.addObject("userProfile", userMgmtService.getUserProfile(userId));
		mav.addObject("userPictureList", userMgmtService.getUserPictureList(userId));
		mav.setViewName("jsonView");
		return mav;
	}
	
	/* 가입 요청 승인 관리 */
	
	// 가입 요청 회원 리스트 조회
	@RequestMapping(value="registerlist.do")
	public String signupWaitList(Model model) {
		model.addAttribute("userAllCnt", userMgmtService.getUserAllCnt());
		model.addAttribute("userWaitCnt", userMgmtService.getWaitCnt());
		model.addAttribute("reportCnt", userMgmtService.getReportCnt());
		model.addAttribute("list", userMgmtService.getSignupWaitList());
		return "admin/user/registerlist";
	}
	// 가입 요청 승인
	@RequestMapping(value="signupadmit.do")
	public String admitSignupUser(@RequestParam("userId") String userId, Model model) {
		int result = userMgmtService.admitSignupUser(userId);
		return signupWaitList(model);
	}
	
	/* 신고 회원 관리 */
	
	// 신고 리스트 조회
	@RequestMapping(value="reporterlist.do")
	public String reportList(Model model) {
		model.addAttribute("userAllCnt", userMgmtService.getUserAllCnt());
		model.addAttribute("userWaitCnt", userMgmtService.getWaitCnt());
		model.addAttribute("reportCnt", userMgmtService.getReportCnt());
		model.addAttribute("list", userMgmtService.getReportList());
		return "admin/user/reporterlist";
	}
	// 신고 처리(신고처리완료 및 사용자 정지)
	@RequestMapping(value="completereport.do")
	public String suspendReport(@RequestParam("reportNo") int reportNo, Model model) {
		int reportResult = userMgmtService.completeReport(reportNo);
		int userResult = userMgmtService.suspendUser(reportNo);
		return reportList(model);
	}
	// 신고처리
	@RequestMapping(value="holdreport.do")
	public String holdReport(@RequestParam("reportNo") int reportNo, Model model) {
		int result = userMgmtService.holdReport(reportNo);
		return reportList(model);
	}
}
