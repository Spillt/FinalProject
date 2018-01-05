package com.godsky.findlove.main.matchboard.iwc.model.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.godsky.findlove.main.matchboard.iwc.model.dao.IwcDao;
import com.godsky.findlove.main.matchboard.iwc.model.vo.Iwc;

@Service("iwcService")
public class IwcServiceImpl implements IwcService {
	
	@Autowired
	IwcDao iwcDao;

	@Override
	public List<Iwc> selectInitIwcList(Map<String, Object> map) {
		return iwcDao.selectInitIwcList(map);
	}

}
