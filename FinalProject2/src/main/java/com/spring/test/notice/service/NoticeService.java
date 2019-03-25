package com.spring.test.notice.service;


import java.util.List;
import java.util.Map;

import com.spring.test.admin.model.vo.Notice;

public interface NoticeService {
	List<Map<String,String>> selectMainNoticeList();
	List<Map<String,String>> selectNoticeList(int cPage, int numPerPage);
	int selectNoticeCount();
	List<Map<String,String>> selectSearchNoticeList(int cPage, int numPerPage, String word);
	int selectSearchNoticeCount(String word);
	int deleteNoticeList(List noticeNoList);
	int insertNotice(Notice n);
	List<Map<String,String>> selectNoticeContent(int noticeNo);
	int updateNotice(Notice n);
}
