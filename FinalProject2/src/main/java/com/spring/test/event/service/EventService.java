package com.spring.test.event.service;

import java.util.List;
import java.util.Map;

import com.spring.test.admin.model.vo.Event;

public interface EventService {
	List<Map<String,String>> main_slide_eventList();
	List<Map<String,String>> selectEventList(int cPage, int numPerPage);
	int selectEventCount();
	List<Map<String,String>> selectSearchEventList(int cPage, int numPerPage, String word);
	int selectSearchEventListCount(String word);
	int deleteEventList(List eventNoList);
	List<Map<String,String>> selectEventContent(int eventNo);
	int insertEvent(Map<String, String> event);
	int updateEvent(Event e);
}
