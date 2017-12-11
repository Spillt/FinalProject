package com.godsky.findlove.main.faq.dao;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;

import com.godsky.findlove.main.common.dao.AbstractDAO;

@Repository("FaqDao")
public class FaqDao extends AbstractDAO {
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("findlove.selectBoardList", map);
	}
	
}
