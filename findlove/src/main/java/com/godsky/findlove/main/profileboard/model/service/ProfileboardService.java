package com.godsky.findlove.main.profileboard.model.service;

import java.util.*;
import com.godsky.findlove.user.model.vo.Profile;

public interface ProfileboardService {
	
	List<Map<String, Object>> selectProfileList(Map<String, Object> map) throws Exception;
	
}
