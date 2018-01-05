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
import com.godsky.findlove.main.inq.model.vo.Inq;


@Controller
public class BoardMgmtController {

	@Autowired
	private BoardMgmtService boardMgmtService;
	
	public BoardMgmtController() {}
	
	@RequestMapping(value="boardnoticelist.do")
	public String boardNoticeList(@RequestParam("pageNo") int pageNo, Model model) {
		int noticeCnt = boardMgmtService.getNoticeCnt();
		
		int capacity = 7;
		int pageCnt = (int)(Math.ceil((double)noticeCnt/capacity));
		int startIdx = 1 + capacity*(pageNo-1);
		int lastIdx = startIdx + capacity - 1;
		if(pageNo == pageCnt) {
			lastIdx -= noticeCnt%capacity;
		}
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("pageNo", pageNo);
		List<Notice> noticeList = boardMgmtService.selectNoticeList(startIdx, lastIdx);
		model.addAttribute("list", noticeList);
		return "admin/board/boardnoticelist";
	}
	
	@RequestMapping(value="boardfaqlist.do")
	public String boardFaqList(@RequestParam("pageNo") int pageNo, Model model) {
		int faqCnt = boardMgmtService.getFaqCnt();
		
		int capacity = 7;
		int pageCnt = (int)(Math.ceil((double)faqCnt/capacity));
		int startIdx = 1 + capacity*(pageNo-1);
		int lastIdx = startIdx + capacity - 1;
		if(pageNo == pageCnt) {
			lastIdx -= faqCnt%capacity;
		}
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("pageNo", pageNo);
		
		List<Faq> faqList = boardMgmtService.selectFaqList(startIdx, lastIdx);
		model.addAttribute("list", faqList);
		return "admin/board/boardfaqlist";
	}
	
	@RequestMapping(value="boardeventlist.do")
	public String boardEventList(@RequestParam("pageNo") int pageNo, Model model) {
		int eventCnt = boardMgmtService.getPollCnt();
		
		int capacity = 7;
		int pageCnt = (int)(Math.ceil((double)eventCnt/capacity));
		int startIdx = 1 + capacity*(pageNo-1);
		int lastIdx = startIdx + capacity - 1;
		if(pageNo == pageCnt) {
			lastIdx -= eventCnt%capacity;
		}
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("pageNo", pageNo);
		
		List<Poll> pollList = boardMgmtService.selectPollList(startIdx, lastIdx);
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
			resultMav = boardNoticeList(1, model);
		} else if(board.getBoardType().equals("FAQ")) {
			boardMgmtService.insertFaqList(board);
			resultMav = boardFaqList(1, model);
		} else {
			boardMgmtService.insertEventList(board);
			resultMav = boardEventList(1, model);
		}
		return resultMav;
	}
	
	@RequestMapping(value="boarddelete.do")
	public String boardDelete(@RequestParam("boardType") String boardType, @RequestParam("boardNo") int boardNo, Model model) {

		String resultMav;
		
		if(boardType.equals("notice")) {
			boardMgmtService.deleteNotice(boardNo);
			resultMav = boardNoticeList(1, model);
		} else if(boardType.equals("faq")) {
			boardMgmtService.deleteFaq(boardNo);
			resultMav = boardFaqList(1, model);
		} else {
			boardMgmtService.deleteEvent(boardNo);
			resultMav = boardEventList(1, model);
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
			resultMav = boardNoticeList(1, model);
		} else if(board.getBoardType().equals("FAQ")) {
			boardMgmtService.updateFaq(board);
			resultMav = boardFaqList(1, model);
		} else {
			boardMgmtService.updateEvent(board);
			resultMav = boardEventList(1, model);
		}
		return resultMav;
	}
	
	@RequestMapping(value="boardcnt.do")
	public ModelAndView boardUpdate() {
		ModelAndView mav = new ModelAndView();
		int noticeCnt = boardMgmtService.getNoticeCnt();
		int faqCnt = boardMgmtService.getFaqCnt();
		int pollCnt = boardMgmtService.getPollCnt();
		int inqCnt = boardMgmtService.getInqCnt();
		mav.addObject("noticeCnt", noticeCnt);
		mav.addObject("faqCnt", faqCnt);
		mav.addObject("pollCnt", pollCnt);
		mav.addObject("inqCnt", inqCnt);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="inqlist.do")
	public String inqList(Model model) {
		List<Inq> list = boardMgmtService.getInqWaitList();
		model.addAttribute("list", list);
		return "admin/board/inqlist";
	}
	
	@RequestMapping(value="reportboardlist.do")
	public String reportboardList() {
		return "admin/board/reportboardlist";
	}
	
	@RequestMapping(value="inqmgmtdetail.do",  produces = "application/json; charset=utf8")
	public ModelAndView userDetail(@RequestParam("inqNo") int inqNo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("inq", boardMgmtService.getInq(inqNo));
		mav.setViewName("jsonView");
		return mav;
	}
}
