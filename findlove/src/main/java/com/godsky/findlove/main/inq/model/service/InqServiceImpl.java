package com.godsky.findlove.main.inq.model.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.inq.model.dao.InqDao;

@Service("InqService")
public class InqServiceImpl implements InqService{
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="InqDao")
	private InqDao inqDao;
	
	//전체 리스트 조회
	@Override
	public List<Map<String, Object>> selectInqList(Map<String, Object> map) throws Exception{
		return inqDao.selectInqList(map);
	}
}
