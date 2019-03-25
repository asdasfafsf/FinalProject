package com.spring.test.event.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.test.admin.model.vo.Event;

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
	//이벤트
		@Override
		public List<Map<String, String>> selectEventList(int cPage, int numPerPage) {
			// TODO Auto-generated method stub
			RowBounds rb=new  RowBounds((cPage-1)*numPerPage,numPerPage);
			return session.selectList("admin.selectEventList",null,rb);
		}

		@Override
		public int selectEventCount() {
			// TODO Auto-generated method stub
			return session.selectOne("admin.selectEventCount");
		}

		@Override
		public int deleteEventList(List eventNoList) {
			// TODO Auto-generated method stub
			return session.delete("admin.deleteEventList",eventNoList);
		}
		
		@Override
		public List<Map<String, String>> selectEventContent(int eventNo) {
			// TODO Auto-generated method stub
			return session.selectList("admin.selectEventContent", eventNo);
		}
		@Override
		public int insertEvent(Map<String, String> event) {
			// TODO Auto-generated method stub
			return session.insert("admin.insertEvent",event);
		}
		@Override
		public int updateEvent(Event e) {
			// TODO Auto-generated method stub
			return session.update("admin.updateEvent",e);
		}
		@Override
		public List<Map<String, String>> selectSearchEventList(int cPage, int numPerPage, String word) {
			// TODO Auto-generated method stub
			RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
			return session.selectList("admin.selectSearchEventList",word,rb);
		}
		
		@Override
		public int selectSearchEventCount(String word) {
			// TODO Auto-generated method stub
			System.out.println("dao "+word);
			return session.selectOne("admin.selectSearchEventCount",word);
		}
}
