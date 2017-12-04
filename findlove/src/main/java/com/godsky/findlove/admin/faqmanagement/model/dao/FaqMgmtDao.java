package com.godsky.findlove.admin.faqmanagement.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.admin.faqmanagement.model.vo.Faq;

@Repository("faqMgmtDao")
public class FaqMgmtDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Faq> getFaqList() {
		return null;
	}

	public Faq getFaq(int no) {
		return null;
	}

	public int insertFaq() {
		return 0;
	}

	public int updateFaq(Faq faq) {
		return 0;
	}

	public int deleteFaq(int no) {
		return 0;
	}

}
