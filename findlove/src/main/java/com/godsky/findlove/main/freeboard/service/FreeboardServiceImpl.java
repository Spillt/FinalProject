package com.godsky.findlove.main.freeboard.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.freeboard.dao.*;

@Service("FreeboardService")
public class FreeboardServiceImpl implements FreeboardService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="FreeboardDao")
	private FreeboardDao FreeboardDao;
	
	@Override
	public List<Map<String, Object>> selectFreeboardList(Map<String, Object> map) throws Exception {
		
		return FreeboardDao.selectFreeboardService(map);
	}
	
	//작성하기
	@Override
	public void insertFreeboard(Map<String, Object> map) throws Exception{
		FreeboardDao.insertFreeboard(map);
	}

}
