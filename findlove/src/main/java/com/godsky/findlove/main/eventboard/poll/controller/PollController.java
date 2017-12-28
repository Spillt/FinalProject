package com.godsky.findlove.main.eventboard.poll.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.eventboard.poll.model.service.PollService;
import com.godsky.findlove.main.eventboard.poll.model.vo.Poll;
import com.godsky.findlove.main.eventboard.poll.model.vo.PollAnswer;
import com.godsky.findlove.main.eventboard.poll.model.vo.PollResult;

@Controller
public class PollController {

	@Autowired
	private PollService pollService;

	public PollController() {
	}

	// 목록 전체 보기
	@RequestMapping(value = "polllist.do")
	public ModelAndView pollList(Model model, @RequestParam("userId") String userId) {
		List<Poll> list = pollService.listAll();
		List<Poll> mylist = pollService.listAll(userId);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("main/eventboard/poll/polllist");
		mv.addObject("list", list);
		mv.addObject("mylist", mylist);
		return mv;
	}

	// 상세 보기
	@RequestMapping(value = "polldetail.do", method = { RequestMethod.GET })
	public ModelAndView pollDetail(@RequestParam int pollNo) {

		// 모델(데이터)+뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("main/eventboard/poll/polldetail");
		// 뷰에 전달할 데이터
		mav.addObject("poll", pollService.polldetail(pollNo));
		return mav;
	}

	// 답변 입력
	@RequestMapping(value = "pollAnswer.do")
	public ModelAndView pollAnswer(@ModelAttribute PollAnswer answer, Model model) {

		pollService.pollAnswer(answer);
		return pollList(model, answer.getUser_id());
	}

	// 결과보기
	@RequestMapping(value = "pollresult.do", method = { RequestMethod.GET })
	public ModelAndView pollResult(@RequestParam int pollNo) {

		List<PollResult> pollResults = pollService.pollResult(pollNo);

		ModelAndView mav = new ModelAndView();

		mav.setViewName("main/eventboard/poll/pollresult");
		mav.addObject("poll", pollService.polldetail(pollNo));
		mav.addObject("statistics", pollResults);
		return mav;
	}

}
