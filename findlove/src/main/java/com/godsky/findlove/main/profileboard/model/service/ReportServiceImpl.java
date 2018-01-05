package com.godsky.findlove.main.profileboard.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.godsky.findlove.common.model.vo.Report;
import com.godsky.findlove.main.profileboard.model.dao.ReportDAO;

@Service("reportService")
public class ReportServiceImpl implements ReportService{
	
	@Resource(name="reportDAO")
    private ReportDAO reportDAO;	

	@Override
	public int sendReport(Report report) {
		return reportDAO.sendReport(report);
	}

	@Override
	public int checkReport(Report report) {
		return reportDAO.checkReport(report);
	}

}
