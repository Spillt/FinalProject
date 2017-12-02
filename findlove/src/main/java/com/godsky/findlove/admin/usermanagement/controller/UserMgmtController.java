package com.godsky.findlove.admin.usermanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.godsky.findlove.admin.usermanagement.model.service.UserMgmtService;
import com.godsky.findlove.admin.usermanagement.model.vo.User;

@Controller
public class UserMgmtController {

	@Autowired
	private UserMgmtService userMgmtService;
	
	public UserMgmtController() {}
	
	/* 전체 회원 관리 */
	
	// 전체 회원 리스트 조회
	@RequestMapping(value="userlist.do")
	public String userList(Model model) {
		model.addAttribute("list", userMgmtService.getUserList());
		return null;
	}
	// 회원 상세 조회
	@RequestMapping(value="userdeatil.do")
	public String userDetail(User user, Model model) {
		model.addAttribute("user", userMgmtService.getUserDetail(user));
		return null;
	}
	
	/* 가입 요청 승인 관리 */
	
	// 가입 요청 회원 리스트 조회
	@RequestMapping(value="signuplist.do")
	public String signupUserList(Model model) {
		model.addAttribute("list", userMgmtService.getSignupUserList());
		return null;
	}
	// 가입 요청 승인,거부 처리
	@RequestMapping(value="signupadmit.do")
	public String admitSignupUser(User user, Model model) {
		int result = userMgmtService.admitSignupUser(user);
		return null;
	}
	
	/* 신고 회원 관리 */
	
	// 신고 회원 리스트 조회
	@RequestMapping(value="resportlist.do")
	public String reportUserList(Model model) {
		model.addAttribute("list", userMgmtService.getReportUserList());
		return null;
	}
	// 신고 회원 정지,보류 처리
	@RequestMapping(value="suspenduser.do")
	public String suspendUser(User user, Model model) {
		int result = userMgmtService.suspendUser(user);
		return null;
	}
}
