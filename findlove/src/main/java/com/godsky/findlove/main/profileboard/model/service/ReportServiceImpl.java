package com.godsky.findlove.main.profileboard.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.godsky.findlove.main.profileboard.model.dao.ReportDAO;
import com.godsky.findlove.main.profileboard.model.vo.Report;

@Service("reportService")
public class ReportServiceImpl implements ReportService{
	
	@Resource(name="reportDAO")
    private ReportDAO reportDAO;
	
	@Override
	public int sendReport(Report report) {
		return reportDAO.sendMessage(report);
	}

}
