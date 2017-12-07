package com.godsky.findlove.main.matchboard.Idealworldcup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.godsky.findlove.main.matchboard.Idealworldcup.model.service.IWCService;

@Controller
public class IWCController {
	@Autowired
	private static IWCService iwcservice;

	public IWCController() {
	}

	// �씠�긽�삎�썡�뱶而듯럹�씠吏�
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
