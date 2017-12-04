package com.godsky.findlove.main.faq.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface FaqService {
	
	List<Map<String, Object>> selectInqList(Map<String, Object> map) throws Exception;

	void insertInq(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> selectInqDetail(Map<String, Object> map) throws Exception;

	void deleteInq(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectfaqList(Map<String, Object> commandMap);

	List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception;

}
