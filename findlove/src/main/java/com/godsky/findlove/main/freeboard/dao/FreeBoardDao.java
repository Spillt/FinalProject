package com.godsky.findlove.freeBoard.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.godsky.findlove.common.dao.AbstractDAO;

@Repository("FreeBoardDao")
public class FreeBoardDao extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("FreeBoard.selectBoardList", map);
	}

	public void insertBoard(Map<String, Object> map) throws Exception{
		insert("FreeBoard.insertBoard", map);
	}

	public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("FreeBoard.updateHitCnt", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("FreeBoard.selectFreeBoardDetail", map);
	}

	public void updateFreeBoard(Map<String, Object> map) throws Exception{
		update("FreeBoard.updateFreeBoard", map);
	}

	public void deleteFreeBoard(Map<String, Object> map) throws Exception{
		update("FreeBoard.deleteFreeBoard", map);
	}

	public void insertFile(Map<String, Object> map) throws Exception{
		insert("FreeBoard.insertFile", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("FreeBoard.selectFileList", map);
	}

	public void deleteFileList(Map<String, Object> map) throws Exception{
		update("FreeBoard.deleteFileList", map);
	}

	public void updateFile(Map<String, Object> map) throws Exception{
		update("FreeBoard.updateFile", map);
	}
	
	// 댓글 목록
    public ReplyList<FreeBoard> Replylist(Integer bno);
    // 댓글 입력
    public void Replycreate(FreeBoard vo);
    // 댓글 수정
    public void Replyupdate(FreeBoard vo);
    // 댓글 삭제
    public void Replydelete(Integer rno);

}
