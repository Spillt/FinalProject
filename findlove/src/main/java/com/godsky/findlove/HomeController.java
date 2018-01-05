package com.godsky.findlove;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.admin.boardmanagement.model.service.BoardMgmtService;
import com.godsky.findlove.admin.statisticmanagement.model.service.StatisticMgmtService;
import com.godsky.findlove.admin.usermanagement.model.vo.MatchCouple;
import com.godsky.findlove.admin.usermanagement.model.vo.UserDetail;
import com.godsky.findlove.common.model.vo.Notice;
import com.godsky.findlove.main.freeboard.vo.Freeboard;
import com.godsky.findlove.user.model.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	@Autowired
	private StatisticMgmtService statisticMgmtService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BoardMgmtService boardMgmtService;
	
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(Model model) {
		
		List<UserDetail> list = statisticMgmtService.getGradeTopNUser(3);
		model.addAttribute("list", list);
		
		List<MatchCouple> list2 = statisticMgmtService.getMatchCouple(3);
		model.addAttribute("coupleList", list2);
		
		List<Freeboard> list3 = statisticMgmtService.getPopularBoard(3);
		model.addAttribute("popularBoardList", list3);
		
		List<Notice> list4 = boardMgmtService.getNewNoticeList(2);
		
		model.addAttribute("newNoticeList", list4);
		
		return "home";
	}
	
	@RequestMapping(value="topnuser.do")
	public ModelAndView topNUser(@RequestParam("category") String category, @RequestParam("n") int n) {
		ModelAndView mav = new ModelAndView();
		
		List<UserDetail> list;
		
		if(!category.equals("평점")) {
			list = statisticMgmtService.getGradeTopNUser(3);
		} else {
			list = statisticMgmtService.getFavoriteTopNUser(3);
		}
		for(UserDetail user : list) {
			System.out.println(user);
		}
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="realtimepointcnt.do")
	public ModelAndView realTimePointCnt(@RequestParam("userId") String userId) {
		ModelAndView mav = new ModelAndView();
		int point = userService.getPointCnt(userId);
		int konpeito = userService.getKonpeitoCnt(userId);
		mav.addObject("point", point);
		mav.addObject("konpeito", konpeito);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
}
