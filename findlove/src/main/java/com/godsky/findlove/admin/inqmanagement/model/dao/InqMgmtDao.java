package com.godsky.findlove.admin.inqmanagement.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.admin.inqmanagement.model.vo.Inq;

@Repository("inqMgmtDao")
public class InqMgmtDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Inq> getInqList() {
		return null;
	}

	public ArrayList<Inq> getInqWaitList() {
		return null;
	}

	public Inq getInq(int no) {
		return null;
	}

	public int inqAnswer(Inq inq) {
		return 0;
	}
}
