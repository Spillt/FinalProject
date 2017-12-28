package com.godsky.findlove.main.profileboard.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.godsky.findlove.main.profileboard.model.dao.GradeDAO;
import com.godsky.findlove.main.profileboard.model.vo.Grade;

@Service("gradeService")
public class GradeServiceImpl implements GradeService{

	@Resource(name="gradeDAO")
	private GradeDAO gradeDAO;
	
	@Override
	public int checkGrade(Grade grades) {
		return gradeDAO.checkGrade(grades);
	}
	
	@Override
	public int sendGrade(Grade grades) {
		return gradeDAO.sendGrade(grades);
	}

}
