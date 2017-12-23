package com.godsky.findlove.main.freeboard.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
	public List<Map<String, Object>> selectFreeboardList(Map<String, Object> map) throws Exception {

		return FreeboardDao.selectFreeboardService(map);
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

	//삭제하기
	@Override
	public int deleteFreeboard(int freeNo) throws Exception{
		return FreeboardDao.deleteFreeboard(freeNo);
	}
}
