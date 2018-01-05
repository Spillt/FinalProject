package com.godsky.findlove.main.inq.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.inq.model.vo.Inq;

@Repository("InqDao")
public class InqDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@SuppressWarnings("unchecked")
	public List<Inq> selectInqList(String inqWriter) throws Exception{
		return sqlSession.selectList("inq.selectInqList", inqWriter);
	}
	
	//문의 작성
	public int insertInq(Inq inq) throws Exception{
		return sqlSession.insert("inq.insertInq", inq);
	}

	//상세보기
	public Inq detailInq(int inqNo) throws Exception{
		return sqlSession.selectOne("inq.detailInq", inqNo);
	}

	//삭제하기
	public int deleteInq(int inqNo) throws Exception{
		return sqlSession.delete("inq.deleteInq", inqNo);
	}

	//답변하기
	public int resendInq(Inq inq) throws Exception{
		return sqlSession.insert("inq.resendInq", inq);
	}
}
