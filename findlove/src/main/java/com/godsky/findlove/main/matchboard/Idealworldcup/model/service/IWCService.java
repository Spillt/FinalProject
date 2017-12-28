package com.godsky.findlove.main.matchboard.Idealworldcup.model.service;

import java.util.List;
import java.lang.*;

import com.godsky.findlove.main.matchboard.Idealworldcup.model.vo.IdealWorldCup;

public interface IWCService {

	List<IdealWorldCup> list(String gender);

	String selectUserGender(String userId);
}
