package com.godsky.findlove.main.matchboard.iwc.model.service;

import java.util.List;
import java.lang.*;

import com.godsky.findlove.main.matchboard.iwc.model.vo.IdealWorldCup;

public interface IWCService {

	List<IdealWorldCup> list(String gender);

	String selectUserGender(String userId);
}
