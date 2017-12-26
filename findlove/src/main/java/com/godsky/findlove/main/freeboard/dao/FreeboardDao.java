package com.godsky.findlove.main.freeboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.freeboard.vo.Freeboard;

@Repository("FreeboardDao")
public class FreeboardDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFreeboardService(Map<String, Object> map) throws Exception{	
		return sqlSession.selectList("freeboard.selectFreeboardList");
	}

	//작성하기
	public int insertFreeboard(Freeboard freeboard) throws Exception{
		return sqlSession.insert("freeboard.insertFreeboard", freeboard);
	}
	
	//상세보기
	public Freeboard detailFreeboard(int freeNo) throws Exception{
		return sqlSession.selectOne("freeboard.detailFreeboard", freeNo);
	}	
	
	//수정하기
	public Freeboard selectFreeboard(int freeNo) throws Exception{
		//System.out.println(freeboard);
		return sqlSession.selectOne("freeboard.selectFreeboard", freeNo);
	}
	public int updateFreeboard(Freeboard Freeboard) throws Exception{
		System.out.println(Freeboard);
		return sqlSession.update("freeboard.updateFreeboard", Freeboard);
	}

	//삭제하기
	public int deleteFreeboard(int freeNo) throws Exception{
		return sqlSession.delete("freeboard.deleteFreeboard", freeNo);
	}

	//조회수 증가
	public int updateReadCnt(int freeNo) throws Exception{
		return sqlSession.update("freeboard.updateReadCnt", freeNo);
	}

	/*//댓글 입력
	public void insertReply(Freeboard Freeboard) {
		sqlSession.insertReply("freeboard.sqlSession", Freeboard);
		
	}*/

	
	

}
