package com.godsky.findlove.admin.faqmanagement.model.service;

import java.util.ArrayList;

import com.godsky.findlove.admin.faqmanagement.model.vo.Faq;

public interface FaqMgmtService {

	ArrayList<Faq> getFaqList();
	Faq getFaq(int no);
	int insertFaq();
	int updateFaq(Faq faq);
	int deleteFaq(int no);

}
