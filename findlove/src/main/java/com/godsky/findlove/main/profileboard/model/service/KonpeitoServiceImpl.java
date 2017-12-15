package com.godsky.findlove.main.profileboard.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.godsky.findlove.main.profileboard.model.dao.KonpeitoDAO;

@Service("konpeitoService")
public class KonpeitoServiceImpl implements KonpeitoService{

	@Resource(name="konpeitoDAO")
    private KonpeitoDAO konpeitoDAO;
	
	@Override
	public int checkpoint(String senderId) {
		return konpeitoDAO.checkpoint(senderId);
	}

}
