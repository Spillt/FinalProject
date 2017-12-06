package com.godsky.findlove.main.profileboard.model.service;

import java.util.*;
import com.godsky.findlove.user.model.vo.Profile;

public interface ProfileboardService {
	
	int getListCount();
	
	ArrayList<Profile> selectList();
	
	ArrayList<Profile> selectSearch();
	
	Profile selectProfile();
	
	int reportProfile();
	
	int sendMessage();
	
}
