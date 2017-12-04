package com.godsky.findlove.admin.faqmanagement.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.admin.faqmanagement.model.dao.FaqMgmtDao;
import com.godsky.findlove.admin.faqmanagement.model.vo.Faq;


@Service("faqMgmtService")
public class FaqMgmtServiceImpl implements FaqMgmtService {
	
	@Autowired
	FaqMgmtDao faqMgmtDao;
	
	@Override
	public ArrayList<Faq> getFaqList() {
		return faqMgmtDao.getFaqList();
	}
	@Override
	public Faq getFaq(int no) {
		return faqMgmtDao.getFaq(no);
	}
	@Override
	public int insertFaq() {
		return faqMgmtDao.insertFaq();
	}
	@Override
	public int updateFaq(Faq faq) {
		return faqMgmtDao.updateFaq(faq);
	}
	@Override
	public int deleteFaq(int no) {
		return faqMgmtDao.deleteFaq(no);
	}

}
