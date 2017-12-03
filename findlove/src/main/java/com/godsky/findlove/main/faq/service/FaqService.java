package com.godsky.findlove.faq.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface FaqService {
	
	List<Map<String, Object>> selectInqList(Map<String, Object> map) throws Exception;

	void insertInq(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> selectInqDetail(Map<String, Object> map) throws Exception;

	void deleteInq(Map<String, Object> map) throws Exception;

}
