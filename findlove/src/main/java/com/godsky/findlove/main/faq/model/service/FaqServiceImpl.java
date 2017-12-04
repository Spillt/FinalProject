package com.godsky.findlove.main.faq.model.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.faq.model.dao.FaqDao;

@Service("sampleService")
public class FaqServiceImpl implements FaqService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="sampleDAO") 
	private FaqDao FaqDAO; 


	@Override
	public List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception {
		return null;
	}


	@Override
	public List<Map<String, Object>> selectInqList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void insertInq(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		
	}


	@Override
	public Map<String, Object> selectInqDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void deleteInq(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}


	@Override
	public List<Map<String, Object>> selectfaqList(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return null;
	}

}
