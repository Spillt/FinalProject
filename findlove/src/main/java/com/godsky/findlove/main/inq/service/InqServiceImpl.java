package com.godsky.findlove.main.inq.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import com.godsky.findlove.main.inq.dao.InqDao;



public class InqServiceImpl implements InqService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="InqDao")
	private InqDao InqDao;
	
	@Override
	public List<Map<String, Object>> selectInqList(Map<String, Object> map) throws Exception {
		return InqDao.selectInqList(map);
		
	}
	
	@Override
	public Map<String, Object> selectInqDetail(Map<String, Object> map) throws Exception {
		//InqDao.updateHitCnt(map);
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = InqDao.selectInqDetail(map);
		resultMap.put("map", tempMap);
		
		//List<Map<String,Object>> list = InqDao.selectFileList(map);
		//resultMap.put("list", list);
		
		return resultMap;
	}

}
