package com.godsky.findlove.main.faq.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.faq.model.vo.Faq;

@Repository("FaqDao")
public class FaqDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@SuppressWarnings("unchecked")
	public List<Faq> openFaqList(String faqGB) {
		return sqlSession.selectList("faq.openFaqList", faqGB);
	}


	public Faq faqDetail(int faqNo) {
		return sqlSession.selectOne("faq.faqDetail", faqNo);
	}

}
