package com.godsky.findlove.main.freeboard.dao;

import java.util.List;
import java.util.Map;

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
	public Freeboard detailFreeboard(int freeNo) {
		return sqlSession.selectOne("freeboard.detailFreeboard", freeNo);
	}
	
	//조회수 증가
	/*public void updateReadCnt(Freeboard freeboard) throws Exception{
		update("freeboard.updateReadCnt", freeboard);
	}*/
	

	//삭제하기
	public int deleteFreeboard(int freeNo) {
		return sqlSession.delete("freeboard.deleteFreeboard", freeNo);
	}

	

	

}
