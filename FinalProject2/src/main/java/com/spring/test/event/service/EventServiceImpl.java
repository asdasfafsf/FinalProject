package com.spring.test.event.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.test.admin.model.vo.Event;
import com.spring.test.event.dao.EventDao;

@Service
public class EventServiceImpl implements EventService {
	@Autowired
	EventDao dao;
	
	@Override
	public List<Map<String, String>> main_slide_eventList() {
		// TODO Auto-generated method stub
		return dao.main_slide_eventList();
	}
	//이벤트
		@Override
		public List<Map<String, String>> selectEventList(int cPage, int numPerPage) {
			// TODO Auto-generated method stub
			return dao.selectEventList(cPage, numPerPage);
		}

		@Override
		public int selectEventCount() {
			// TODO Auto-generated method stub
			return dao.selectEventCount();
		}

		@Override
		public List<Map<String, String>> selectSearchEventList(int cPage, int numPerPage, String word) {
			// TODO Auto-generated method stub
			return dao.selectSearchEventList(cPage,numPerPage,word);
		}

		@Override
		public int selectSearchEventListCount(String word) {
			// TODO Auto-generated method stub
			return dao.selectSearchEventCount(word);
		}

		@Override
		public int deleteEventList(List eventNoList) {
			// TODO Auto-generated method stub
			return dao.deleteEventList(eventNoList);
		}
		@Override
		public List<Map<String, String>> selectEventContent(int eventNo) {
			// TODO Auto-generated method stub
			return dao.selectEventContent(eventNo);
		}
		@Override
		public int insertEvent(Map<String, String> event) {
			// TODO Auto-generated method stub
			return dao.insertEvent(event);
		}
		@Override
		public int updateEvent(Event e) {
			// TODO Auto-generated method stub
			return dao.updateEvent(e);
		}

}
