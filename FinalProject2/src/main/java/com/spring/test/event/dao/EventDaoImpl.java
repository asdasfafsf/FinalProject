package com.spring.test.event.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDaoImpl implements EventDao {

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Map<String, String>> main_slide_eventList() {
		// TODO Auto-generated method stub
		RowBounds rowbounds=new RowBounds(0, 5);
		return session.selectList("event.main_slide_eventList",null,rowbounds);
	}
	
}
