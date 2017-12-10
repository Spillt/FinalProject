package com.godsky.findlove.main.profileboard.model.service;

import java.util.*;
import com.godsky.findlove.main.profileboard.model.vo.Profileboard;

public interface ProfileboardService {

	//게시글 전체 목록
	public List<Profileboard> selectProfileList() throws Exception;

	//게시글 상세보기
	public Profileboard selectProfileDetail(String user_nicknm) throws Exception;;
		
}
