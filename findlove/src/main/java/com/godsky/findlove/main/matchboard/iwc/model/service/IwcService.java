package com.godsky.findlove.main.matchboard.iwc.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.godsky.findlove.main.matchboard.iwc.model.vo.Iwc;

public interface IwcService {

	List<Iwc> selectInitIwcList(Map<String, Object> map);
	
}
