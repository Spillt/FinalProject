package com.godsky.findlove.main.freeboard.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.godsky.findlove.main.freeboard.vo.Freeboard;

public interface FreeboardService {
	
	//전체 조회
	public List<Freeboard> selectFreeboardList() throws Exception;
	
	//내 글 전체 조회
	public List<Freeboard> selectMyFreeboardList(String freeWriter) throws Exception;

	//게시판 작성하기
	public int insertFreeboard(Freeboard freeboard) throws Exception;

	//상세보기
	public Freeboard detailFreeboard(int freeNo) throws Exception;
	
	//수정하기
	public Freeboard selectFreeboard(int freeNo,String freeYN) throws Exception;
	public int updateFreeboard(Freeboard freeboard) throws Exception;
	
	//삭제하기
	public int deleteFreeboard(int freeNo) throws Exception;

	//조회수 증가
	public int updateReadCnt(int freeNo) throws Exception;

	

	


	

	

}
