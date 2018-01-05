package com.godsky.findlove.main.faq.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.faq.model.dao.FaqDao;
import com.godsky.findlove.main.faq.model.vo.Faq;

@Service("FaqService")
public class FaqServiceImpl implements FaqService{
	Logger log = Logger.getLogger(this.getClass());
		
	@Resource(name = "FaqDao")
	private FaqDao faqDao;
	
	@Override
	public List<Faq> openFaqList(String faqGB) throws Exception{
		return faqDao.openFaqList(faqGB);
	}

	
	//상세보기
	@Override
	public Faq faqDetail(int faqNo) throws Exception{
		return faqDao.faqDetail(faqNo);
	}
}
