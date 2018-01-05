package com.godsky.findlove.main.faq.model.service;

import java.util.List;

import com.godsky.findlove.main.faq.model.vo.Faq;

public interface FaqService{

	//구분별 리스트 조회
	public List<Faq> openFaqList(String faqGB) throws Exception;

	//상세보기
	public Faq faqDetail(int faqNo) throws Exception;

}
