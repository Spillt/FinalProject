package com.godsky.findlove.main.freeboard.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.freeboard.dao.*;
import com.godsky.findlove.main.freeboard.vo.Freeboard;

@Service("FreeboardService")
public class FreeboardServiceImpl implements FreeboardService {
	Logger log = Logger.getLogger(this.getClass());


	@Resource(name = "FreeboardDao")
	private FreeboardDao FreeboardDao;

	@Override
	public List<Freeboard> selectFreeboardList() throws Exception {
		return FreeboardDao.selectFreeboardService();
	}
	
	//내 목혹 조회
	@Override
	public List<Freeboard> selectMyFreeboardList(String freeWriter) throws Exception {
		return FreeboardDao.selectMyFreeboardService(freeWriter);
	}

	//작성하기
	@Override
	public int insertFreeboard(Freeboard Freeboard)  throws Exception{
		return FreeboardDao.insertFreeboard(Freeboard);
	}
	
	//상세보기
	@Override
	public Freeboard detailFreeboard(int freeNo) throws Exception{
		return FreeboardDao.detailFreeboard(freeNo);
	}
	
	//수정하기
	@Override
	public Freeboard selectFreeboard(int freeNo, String freeYN) throws Exception{
		return FreeboardDao.selectFreeboard(freeNo, freeYN);
	}
	@Override
	public int updateFreeboard(Freeboard Freeboard) throws Exception{
		return FreeboardDao.updateFreeboard(Freeboard);
	}

	//삭제하기
	@Override
	public int deleteFreeboard(int freeNo) throws Exception{
		return FreeboardDao.deleteFreeboard(freeNo);
	}
	
	//조회수 증가
	@Override
	public int updateReadCnt(int freeNo) throws Exception{
		return FreeboardDao.updateReadCnt(freeNo);
	}
}
