package com.godsky.findlove.faq.dao;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.common.dao.AbstractDAO;

@Repository("FaqDao")
public class FaqDao extends AbstractDAO {
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("sample.selectBoardList", map);
	}
}
