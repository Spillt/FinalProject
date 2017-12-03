package com.godsky.findlove.main.inq.model.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.common.dao.AbstractDAO;

@Repository("InqDao")
public class InqDao extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectInqList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("Inq.selectInqList", map);
	}

	public void insertInq(Map<String, Object> map) throws Exception{
		insert("Inq.insertInq", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectInqDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("Inq.selectInqDetail", map);
	}
	
	public void insertFile(Map<String, Object> map) throws Exception{
		insert("Inq.insertFile", map);
	}

	public void updateHitCnt(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	public List<Map<String, Object>> selectFileList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
}
