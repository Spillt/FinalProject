package com.godsky.findlove.main.profileboard.model.service;

import com.godsky.findlove.common.model.vo.Report;

public interface ReportService {

	//신고 하기
	public int sendReport(Report report);

	public int checkReport(Report report);

}
