package com.godsky.findlove.main.matchboard.iwc.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.matchboard.iwc.model.service.IWCService;
import com.godsky.findlove.main.matchboard.iwc.model.vo.IdealWorldCup;

@Controller
public class IWCController {
	private static final String String = null;
	@Autowired
	private IWCService iwcservice;

	public IWCController() {
	}

	// 이상형월드컵
	@RequestMapping(value = "idealworldcup.do", method = RequestMethod.GET)
	public ModelAndView idealWorldCup(@RequestParam("userId") String userId, Locale locale, Model model) {
		String myGender = (String) iwcservice.selectUserGender(userId);
		ArrayList<IdealWorldCup> list = (ArrayList<IdealWorldCup>) iwcservice.list(myGender);
		for (IdealWorldCup ideal : list) {
			System.out.println(ideal);
		}
		// ModelAndView - 모델과 뷰
		System.out.println(myGender);
		ModelAndView mv = new ModelAndView();
		mv.addObject("myGender", myGender);
		mv.setViewName("matchboard/iwc"); // 뷰를 idealworldcup.jsp로 설정
		mv.addObject("list", list);
		return mv; // idealworldcup.jsp로 List가 전달
	}

	@RequestMapping(value = "nextpage", method = RequestMethod.GET)
	public void nextGame() {

	}
}
