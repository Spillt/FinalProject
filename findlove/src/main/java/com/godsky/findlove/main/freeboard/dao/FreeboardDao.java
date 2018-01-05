package com.godsky.findlove.main.freeboard.dao;

import java.util.HashMap;
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
	public List<Freeboard> selectFreeboardService() throws Exception{	
		return sqlSession.selectList("freeboard.selectFreeboardList");
	}
	
	//내 글 조회
	public List<Freeboard> selectMyFreeboardService(String freeWriter) throws Exception{	
		return sqlSession.selectList("freeboard.selectMyFreeboardList", freeWriter);
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
	public Freeboard selectFreeboard(int freeNo, String freeYN) throws Exception{
		//System.out.println(freeboard);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("freeNo", freeNo);
		map.put("freeYN", freeYN);
		return sqlSession.selectOne("freeboard.selectFreeboard", map);
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

	
	

}
