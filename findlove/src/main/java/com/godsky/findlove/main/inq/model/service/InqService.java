package com.godsky.findlove.main.inq.model.service;

import java.util.List;
import java.util.Map;

public interface InqService {
	
	//전체 리스트 조회
	public List<Map<String, Object>> selectInqList(Map<String, Object> map) throws Exception;
}
