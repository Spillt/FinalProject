package com.godsky.findlove.freeBoard.controller;

import java.util.List;
import java.util.Map;

import javax.activation.CommandMap;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.freeBoard.service.FreeBoardService;

@Controller
public class FreeBoardController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="FreeBoardService")
	private FreeBoardService FreeBoardService;
	
	@RequestMapping(value="/findlove/openFreeBoardList.do")
    public ModelAndView openFreeBoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/FreeBoard/FreeBoardList");
    	
    	List<Map<String,Object>> list = FreeBoardService.selectFreeBoardList(commandMap.getMap());
    	mv.addObject("list", list);
    	
    	return mv;
    }
	
	@RequestMapping(value="/findlove/openFreeBoardWrite.do")
	public ModelAndView openFreeBoardWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/FreeBoard/FreeBoardWrite");
		
		return mv;
	}
	
	@RequestMapping(value="/findlove/insertFreeBoard.do")
	public ModelAndView insertFreeBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/FreeBoard/openFreeBoardList.do");
		
		FreeBoardService.insertFreeBoard(commandMap.getMap(), request);
		
		return mv;
	}
	
	@RequestMapping(value="/findlove/openBoardDetail.do")
	public ModelAndView openFreeBoardDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/FreeBoard/FreeBoardDetail");
		
		Map<String,Object> map = FreeBoardService.selectFreeBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/findlove/openFreeBoardUpdate.do")
	public ModelAndView openFreeBoardUpdate(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/FreeBoard/FreeBoardUpdate");
		
		Map<String,Object> map = FreeBoardService.selectFreeBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/findlove/updateFreeBoard.do")
	public ModelAndView updateFreeBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/FreeBoard/openFreeBoardDetail.do");
		
		FreeBoardService.updateFreeBoard(commandMap.getMap(), request);
		
		mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}
	
	@RequestMapping(value="/findlove/deleteFreeBoard.do")
	public ModelAndView deleteFreeBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/FreeBoard/openFreeBoardList.do");
		
		FreeBoardService.deleteFreeBoard(commandMap.getMap());
		
		return mv;
	}
	
	// 댓글 입력
    @RequestMapping("Replyinsert.do")
    public void Replyinsert(@ModelAttribute ReplyVO vo, HttpSession session){
        String userId = (String) session.getAttribute("userId");
        vo.setReplyer(userId);
        replyService.create(vo);
    }
    
    // 댓글 목록(@Controller방식 : veiw(화면)를 리턴)
    @RequestMapping("Replylist.do")
    public ModelAndView Replylist(@RequestParam int bno, ModelAndView mav){
    	ReplyList<ReplyVO> list = replyService.list(bno);
        // 뷰이름 지정
        mav.setViewName("board/replyList");
        // 뷰에 전달할 데이터 지정
        mav.addObject("list", list);
        // replyList.jsp로 포워딩
        return mav;
    }
    
    // 댓글 목록(@RestController Json방식으로 처리 : 데이터를 리턴)
    @RequestMapping("ReplylistJson.do")
    @ResponseBody // 리턴데이터를 json으로 변환(생략가능)
    public ReplyList<FreeBoard> ReplylistJson(@RequestParam int bno){
    	ReplyList<FreeBoard> list = replyService.list(bno);
        return list;
    }
	
}