package com.godsky.findlove.main.matchboard.Idealworldcup.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.matchboard.Idealworldcup.model.service.IWCService;
import com.godsky.findlove.main.matchboard.Idealworldcup.model.vo.IdealWorldCup;
import com.godsky.findlove.main.noticeboard.model.vo.Notice;

@Controller
public class IWCController {
	@Autowired
	private static IWCService iwcservice;

	public IWCController() {
	}
	
	//공지사항게시판
	@RequestMapping(value = "idealworldcup.do", method = RequestMethod.GET)
	public ModelAndView idealWorldCup(Locale locale, Model model) {
		 List<IdealWorldCup> list = IdealWorldCup.listAll();
	        // ModelAndView - 모델과 뷰
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("matchboard/iwc"); // 뷰를 notice.jsp로 설정 
	        mv.addObject("list", list); // 데이터를 저장
	        return mv; // notice.jsp로 List가 전달
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
