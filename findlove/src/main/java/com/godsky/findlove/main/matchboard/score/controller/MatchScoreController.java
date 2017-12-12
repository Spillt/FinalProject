package com.godsky.findlove.main.matchboard.score.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.matchboard.score.service.MatchScoreService;
import com.godsky.findlove.main.matchboard.score.vo.MatchScore;
@Controller
public class MatchScoreController {
	@Autowired
	private MatchScoreService matchScoreService;
	
	public MatchScoreController(){}
	
	
	@RequestMapping(value="insertscore.do", method=RequestMethod.POST)
	public MatchScore insertScore(MatchScore score){
		return null;
	}
	
	@RequestMapping(value="selectmatching.do", method=RequestMethod.POST)
	public MatchScore selectMatching(MatchScore score){
		return null;
	}
	
	@RequestMapping(value="allselect.do")
	public ModelAndView allSelect(String page, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		//페이지 처리용
		int currentPage = 1;
		//한 페이지에 출력할 페이지 갯수 지정
		int limit = 10;
		
		//페이지 숫자가 전송이 왔을 경우
		if(page != null)
			currentPage = Integer.parseInt(page);
		
		//전체 목록 갯수 조회함
		int listCount = matchScoreService.getListCount(); 
		//System.out.println("listCount : " + listCount);
		
		//해당 페이지용 목록 조회
		ArrayList<MatchScore> list = (ArrayList<MatchScore>)matchScoreService.selectList(currentPage,limit);
		
		//총 페이지 수 계산 : 목록이 최소 1개일 때는 한 페이지로 처리함 
		//페이지 1이 되려면 = 목록 0.1 개 + 0.9 계산되게 함
		int maxPage = (int)((double)listCount / limit + 0.9);
		//현재 페이지가 13이면 화면에 보여줄 시작 페이지는 11로 지정
		//(1, 11, 21, 31, .......)
		int startPage = ((int)((double)currentPage / limit + 0.9) - 1) * limit + 1;
		//만약, 목록 아래에 보여질 페이지 갯수가 10개이면
		//현재 페이지가 13이면 끝 페이지수는 20페이지가 되어야 함
		int endPage = startPage + limit - 1;
		if(maxPage < endPage)
			endPage = maxPage;
		
		if(list != null){
			mv.addObject("list", list);
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("listCount", listCount);
			
			mv.setViewName("match/matchListView");
		}else{
			
			mv.addObject("message", "유저 조회 실패");
			
			mv.setViewName("match/matchError");
		}
		return mv;
	}

	
}
