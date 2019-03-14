package com.spring.test.event.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
