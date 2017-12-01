package com.godsky.findlove.notice.model.service;

import com.godsky.findlove.notice.model.vo.Notice;

public interface NoticeService {
		Notice loginCheck();
		String checkRankGb();
		String updateNotice();
		String insertNotice();
		String deleteNotice();
}
