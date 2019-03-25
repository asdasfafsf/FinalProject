package com.spring.test.event.dao;

import java.util.List;
import java.util.Map;

import com.spring.test.admin.model.vo.Event;

public interface EventDao {
	List<Map<String,String>> main_slide_eventList();
	List<Map<String,String>> selectEventList(int cPage, int numPerPage);
	int selectEventCount();
	int deleteEventList(List eventNoList);
	List<Map<String,String>> selectEventContent(int eventNo);
	int insertEvent(Map<String, String> event);
	int updateEvent(Event e);
	List<Map<String,String>> selectSearchEventList(int cPage, int numPerPage, String word);
	int selectSearchEventCount(String word);
}
