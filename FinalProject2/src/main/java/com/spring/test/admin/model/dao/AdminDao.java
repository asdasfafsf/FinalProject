package com.spring.test.admin.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public interface AdminDao {
	List<Map<String,String>> selectNoticeList(int cPage,int numPerPage);
	int selectNoticeCount();
	List<Map<String,String>> selectSearchNoticeList(int cPage, int numPerPage, String word);
	int selectSearchNoticeCount(String word);
	int deleteNoticeList(List noticeNoList);
	
	List<Map<String,String>> selectEventList(int cPage, int numPerPage);
	int selectEventCount();
	int deleteEventList(List eventNoList);
}
