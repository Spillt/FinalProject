package com.godsky.findlove.main.inq.model.service;

import java.util.List;
import java.util.Map;

import com.godsky.findlove.main.inq.model.vo.Inq;

public interface InqService {
	
	//전체 리스트 조회
	public List<Inq> selectInqList(String inqWriter) throws Exception;
	
	//문의 작성
	public int insertInq(Inq inq) throws Exception;

	//상세보기
	public Inq detailInq(int inqNo) throws Exception;

	//삭제하기
	public int deleteInq(int inqNo) throws Exception;

	//답변하기
	public int resendInq(Inq inq) throws Exception;
}
