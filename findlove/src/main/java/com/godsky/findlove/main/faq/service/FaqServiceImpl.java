package com.godsky.findlove.main.faq.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.faq.dao.FaqDao;

@Service("sampleService")
public class FaqServiceImpl implements FaqService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="FaqDAO") 
	private FaqDao FaqDAO; 


	@Override
	public List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception {
		return FaqDao.selectFaqList(map);
	}

}
