package com.godsky.findlove.admin.inqmanagement.model.service;

import java.util.ArrayList;

import com.godsky.findlove.admin.inqmanagement.model.vo.Inq;

public interface InqMgmtService {

	ArrayList<Inq> getInqList();
	ArrayList<Inq> getInqWaitList();
	Inq getInq(int no);
	int inqAnswer(Inq inq);

}
