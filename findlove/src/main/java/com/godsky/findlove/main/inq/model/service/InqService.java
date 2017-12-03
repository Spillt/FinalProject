package com.godsky.findlove.main.inq.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface InqService {
	
	List<Map<String, Object>> selectInqList(Map<String, Object> map) throws Exception;

	Map<String, Object> selectInqDetail(Map<String, Object> map) throws Exception;

}
