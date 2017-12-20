package com.godsky.findlove.main.freeboard.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.godsky.findlove.main.freeboard.vo.Freeboard;

public interface FreeboardService {
	
	//전체 조회
	List<Map<String, Object>> selectFreeboardList(Map<String, Object> map) throws Exception;

	//게시판 작성
	public int insertFreeboard(Freeboard freeboard);

	

}
