package com.godsky.findlove.main.freeboard.service;

import java.util.List;
import java.util.Map;

public interface FreeboardService {
	List<Map<String, Object>> selectFreeboardList(Map<String, Object> map) throws Exception;

}
