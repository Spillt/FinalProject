package com.godsky.findlove.main.freeboard.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.godsky.findlove.main.freeboard.vo.Freeboard;

public interface FreeboardService {
	
	//전체 조회
	public List<Map<String, Object>> selectFreeboardList(Map<String, Object> map) throws Exception;

	//게시판 작성하기
	public int insertFreeboard(Freeboard freeboard) throws Exception;

	//조회수 증가
	//public void updateReadCnt(int freeNo, HttpSession session) throws Exception;

	//상세보기
	public Freeboard detailFreeboard(int freeNo) throws Exception;
	
	//삭제하기
	public int deleteFreeboard(int freeNo) throws Exception;

	

	

}
