package com.godsky.findlove.main.Idealworldcup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.godsky.findlove.main.Idealworldcup.model.service.IWCService;
import com.godsky.findlove.main.Idealworldcup.model.vo.IdealWorldCup;

@Controller
public class IWCController {
	@Autowired
	private static IWCService iwcservice;

	public IWCController() {
	}

	// 이상형월드컵페이지
	@RequestMapping(value = "idealworldcup.do")
	public String idealWorldCup() {
		iwcservice.idealWorldCup();
		return "idealworldcup";
	}

	@RequestMapping(value = "logincheck.do")
	public static String logincheck() {
		iwcservice.logincheck();
		return "idealworldcup";
	}

	@RequestMapping(value = "gender.do")
	public String gender() {
		iwcservice.gender();
		return "idealworldcup";
	}

	@RequestMapping(value = "updateiwc.do")
	public String updateiwc() {
		iwcservice.updateiwc();
		return "idealworldcup";
	}

	@RequestMapping(value = "random.do")
	public String random(){
		iwcservice.random();
		return "idealworldcup";
	}
}
