package com.godsky.findlove.main.faq.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface FaqService {
	
	List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception;

	void insertFaq(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> selectFaqDetail(Map<String, Object> map) throws Exception;

	void deleteFaq(Map<String, Object> map) throws Exception;

}
