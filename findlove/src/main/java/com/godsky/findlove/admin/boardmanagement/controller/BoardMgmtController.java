package com.godsky.findlove.admin.boardmanagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.admin.boardmanagement.model.service.BoardMgmtService;
import com.godsky.findlove.admin.boardmanagement.model.vo.Board;
import com.godsky.findlove.common.model.vo.Faq;
import com.godsky.findlove.common.model.vo.Notice;
import com.godsky.findlove.common.model.vo.Poll;


@Controller
public class BoardMgmtController {

	@Autowired
	private BoardMgmtService boardMgmtService;
	
	public BoardMgmtController() {}
	
	@RequestMapping(value="boardnoticelist.do")
	public String boardNoticeList(Model model) {
		List<Notice> noticeList = boardMgmtService.selectNoticeList();
		model.addAttribute("list", noticeList);
		return "admin/board/boardnoticelist";
	}
	
	@RequestMapping(value="boardfaqlist.do")
	public String boardFaqList(Model model) {
		List<Faq> faqList = boardMgmtService.selectFaqList();
		model.addAttribute("list", faqList);
		return "admin/board/boardfaqlist";
	}
	
	@RequestMapping(value="boardeventlist.do")
	public String boardEventList(Model model) {
		List<Poll> pollList = boardMgmtService.selectPollList();
		model.addAttribute("list", pollList);
		return "admin/board/boardeventlist";
	}
	
	@RequestMapping(value="boardinsertview.do")
	public String boardInsertView(Model model) {
		return "admin/board/boardinsert";
	}
	
	@RequestMapping(value="boardinsert.do")
	public String boardInsert(Board board, Model model) {
		
		String resultMav;
		System.out.println(board);
		if(board.getBoardType().equals("공지사항")) {
			boardMgmtService.insertNotice(board);
			resultMav = boardNoticeList(model);
		} else if(board.getBoardType().equals("FAQ")) {
			boardMgmtService.insertFaqList(board);
			resultMav = boardFaqList(model);
		} else {
			boardMgmtService.insertEventList(board);
			resultMav = boardEventList(model);
		}
		return resultMav;
	}
	
	@RequestMapping(value="boarddelete.do")
	public String boardDelete(@RequestParam("boardType") String boardType, @RequestParam("boardNo") int boardNo, Model model) {

		String resultMav;
		
		if(boardType.equals("notice")) {
			boardMgmtService.deleteNotice(boardNo);
			resultMav = boardNoticeList(model);
		} else if(boardType.equals("faq")) {
			boardMgmtService.deleteFaq(boardNo);
			resultMav = boardFaqList(model);
		} else {
			boardMgmtService.deleteEvent(boardNo);
			resultMav = boardEventList(model);
		}
		return resultMav;
	}
	
	@RequestMapping(value="boardupdateview.do")
	public String boardUpdateView(@RequestParam("boardType") String boardType, @RequestParam("boardNo") int boardNo, Model model) {
		
		if(boardType.equals("notice")) {
			model.addAttribute("notice", boardMgmtService.selectNotice(boardNo));
		} else if(boardType.equals("faq")) {
			System.out.println(boardType);
			System.out.println(boardNo);
			model.addAttribute("faq", boardMgmtService.selectFaq(boardNo));
		} else {
			model.addAttribute("poll", boardMgmtService.selectEvent(boardNo));
		}
		return boardInsertView(model);
	}
	
	@RequestMapping(value="boardupdate.do")
	public String boardUpdate(@ModelAttribute("board") Board board, Model model) {
		
		String resultMav;
		System.out.println(board);
		if(board.getBoardType().equals("공지사항")) {
			boardMgmtService.updateNotice(board);
			resultMav = boardNoticeList(model);
		} else if(board.getBoardType().equals("FAQ")) {
			boardMgmtService.updateFaq(board);
			resultMav = boardFaqList(model);
		} else {
			boardMgmtService.updateEvent(board);
			resultMav = boardEventList(model);
		}
		return resultMav;
	}
	
	@RequestMapping(value="boardcnt.do")
	public ModelAndView boardUpdate() {
		ModelAndView mav = new ModelAndView();
		int noticeCnt = boardMgmtService.getNoticeCnt();
		int faqCnt = boardMgmtService.getFaqCnt();
		int pollCnt = boardMgmtService.getPollCnt();
		mav.addObject("noticeCnt", noticeCnt);
		mav.addObject("faqCnt", faqCnt);
		mav.addObject("pollCnt", pollCnt);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="inqlist.do")
	public String inqList() {
		return "admin/board/inqlist";
	}
	
	@RequestMapping(value="reportboardlist.do")
	public String reportboardList() {
		return "admin/board/reportboardlist";
	}
}
