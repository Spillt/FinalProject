package com.godsky.findlove.main.noticeboard.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.noticeboard.model.service.NoticeService;
import com.godsky.findlove.main.noticeboard.model.vo.Notice;


@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	public NoticeController() {
	}
	//공지사항게시판
	@RequestMapping(value = "notice.do", method = RequestMethod.GET)
	public ModelAndView notice(Locale locale, Model model) {
		 List<Notice> list = noticeService.listAll();
	        // ModelAndView - 모델과 뷰
	        ModelAndView mav = new ModelAndView();
	        mav.setViewName("notice/notice"); // 뷰를 notice.jsp로 설정 
	        mav.addObject("list", list); // 데이터를 저장
	        return mav; // notice.jsp로 List가 전달
	    }
	
	@RequestMapping(value = "detailnotice.do", method = RequestMethod.GET)
		public ModelAndView noticedetail(@RequestParam int noticeNo, HttpSession session) throws Exception{
	        // 조회수 증가 처리
	        noticeService.increaseViewcnt(noticeNo, session);
	        // 모델(데이터)+뷰(화면)를 함께 전달하는 객체
	        ModelAndView mv = new ModelAndView();
	        // 뷰의 이름
	        mv.setViewName("notice/noticedetail");
	        // 뷰에 전달할 데이터
	        mv.addObject("dto", noticeService.read(noticeNo));
	        return mv;
	    }
}
