package com.godsky.findlove.admin.inqmanagement.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.godsky.findlove.admin.inqmanagement.model.dao.InqMgmtDao;
import com.godsky.findlove.admin.inqmanagement.model.vo.Inq;

@Service("inqMgmtService")
public class InqMgmtServiceImpl implements InqMgmtService {

	@Autowired
	InqMgmtDao inqMgmtDao;

	@Override
	public ArrayList<Inq> getInqList() {
		return inqMgmtDao.getInqList();
	}

	@Override
	public ArrayList<Inq> getInqWaitList() {
		return inqMgmtDao.getInqWaitList();
	}

	@Override
	public Inq getInq(int no) {
		return inqMgmtDao.getInq(no);
	}

	@Override
	public int inqAnswer(Inq inq) {
		return inqMgmtDao.inqAnswer(inq);
	}
	
	
}
