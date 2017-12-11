package com.godsky.findlove.main.freeboard.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface FreeBoardService {
	List<Map<String, Object>> selectFreeBoardList(Map<String, Object> map) throws Exception;

	void insertFreeBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> selectFreeBoardDetail(Map<String, Object> map) throws Exception;

	void updateFreeBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void deleteFreeBoard(Map<String, Object> map) throws Exception;
	
	// 댓글 목록
    /*public ReplyList<FreeBoard> list(Integer bno);
    // 댓글 입력
    public void Replycreate(FreeBoard vo);
    // 댓글 수정
    public void Replyupdate(FreeBoard vo);
    // 댓글 삭제
    public void Replydelete(Integer rno);*/
}