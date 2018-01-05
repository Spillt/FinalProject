package com.godsky.findlove.main.inq.model.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.inq.model.dao.InqDao;
import com.godsky.findlove.main.inq.model.vo.Inq;

@Service("InqService")
public class InqServiceImpl implements InqService{
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="InqDao")
	private InqDao inqDao;
	
	//전체 리스트 조회
	@Override
	public List<Inq> selectInqList(String inqWriter) throws Exception{
		return inqDao.selectInqList(inqWriter);
	}
	
	//문의 작성
	@Override
	public int insertInq(Inq inq) throws Exception{
		return inqDao.insertInq(inq);
	}
	
	//상세보기
	@Override
	public Inq detailInq(int inqNo) throws Exception{
		return inqDao.detailInq(inqNo);
	}
	
	//삭제하기
	@Override
	public int deleteInq(int inqNo) throws Exception{
		return inqDao.deleteInq(inqNo);
	}
	
	//답변하기
	@Override
	public int resendInq(Inq inq) throws Exception{
		return inqDao.resendInq(inq);
	}
}
