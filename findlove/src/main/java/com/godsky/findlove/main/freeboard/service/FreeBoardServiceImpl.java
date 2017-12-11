package com.godsky.findlove.main.freeboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.godsky.findlove.main.common.util.*;
import com.godsky.findlove.main.freeboard.dao.FreeBoardDao;

@Service("FreeBoardService")
public class FreeBoardServiceImpl implements FreeBoardService{
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="FreeBoardDao")
	private FreeBoardDao FreeBoardDao;
	
	@Override
	public List<Map<String, Object>> selectFreeBoardList(Map<String, Object> map) throws Exception {
		return FreeBoardDao.selectFreeBoardList(map);
		
	}

	@Override
	public void insertFreeBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		FreeBoardDao.insertFreeBoard(map);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++){
			FreeBoardDao.insertFile(list.get(i));
		}
	}

	@Override
	public Map<String, Object> selectFreeBoardDetail(Map<String, Object> map) throws Exception {
		FreeBoardDao.updateHitCnt(map);
		Map<String, Object> resultMap = new HashMap<String,Object>();
		//Map<String, Object> tempMap = FreeBoardDao.selectFreeBoardDetail(map);
		//resultMap.put("map", tempMap);
		
		List<Map<String,Object>> list = FreeBoardDao.selectFileList(map);
		resultMap.put("list", list);
		
		return resultMap;
	}

	@Override
	public void updateFreeBoard(Map<String, Object> map, HttpServletRequest request) throws Exception{
		FreeBoardDao.updateFreeBoard(map);
		
		FreeBoardDao.deleteFileList(map);
		//List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo(map, request);
		Map<String,Object> tempMap = null;
		/*for(int i=0, size=list.size(); i<size; i++){
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				FreeBoardDao.insertFile(tempMap);
			}
			else{
				FreeBoardDao.updateFile(tempMap);
			}
		}*/
	}

	@Override
	public void deleteFreeBoard(Map<String, Object> map) throws Exception {
		FreeBoardDao.deleteFreeBoard(map);
	}
	
	// 댓글 목록
    /*@Override
    public ReplyList<FreeBoard> list(Integer bno) {
        return FreeBoardDao.Replylist(bno);
    }
    // 댓글 작성
    @Override
    public void Replycreate(FreeBoard vo) {
        replyDao.Replycreate(vo);
    }
    // 댓글 수정
    @Override
    public void Replyupdate(FreeBoard vo) {
        // TODO Auto-generated method stub
 
    }
    // 댓글 삭제
    @Override
    public void Replydelete(Integer rno) {
        // TODO Auto-generated method stub
 
    }*/

}