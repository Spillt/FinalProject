package com.godsky.findlove.main.matchboard.iwc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.godsky.findlove.main.matchboard.iwc.model.service.IwcService;
import com.godsky.findlove.main.matchboard.iwc.model.vo.Iwc;

@Controller
public class IwcController {

	@Autowired
	private IwcService iwcService;
	
	public IwcController() {}
	
	@RequestMapping("iwcmain.do")
	public String iwcMain() {
		return "main/matchboard/iwc/iwcmain";
	}
	
	@RequestMapping("iwcrun.do")
	public String iwcRun(@RequestParam("userId") String userId, @RequestParam("round") int round, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("round", round);
		List<Iwc> initIwcList = iwcService.selectInitIwcList(map);
		model.addAttribute("initIwcList", initIwcList);
		model.addAttribute("round", round);
		
		return "main/matchboard/iwc/iwcrun";
	}
}
