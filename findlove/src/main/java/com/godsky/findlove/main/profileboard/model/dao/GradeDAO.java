package com.godsky.findlove.main.profileboard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.profileboard.model.vo.Grade;

@Repository("gradeDAO")
public class GradeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int sendGrade(Grade grades) {
		return sqlSession.insert("grade.sendGrade", grades);
	}

	public int checkGrade(Grade grades) {
		return sqlSession.selectOne("grade.checkGrade", grades);
	}

}
