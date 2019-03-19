package com.spring.test.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Map<String, String>> selectMainNoticeList() {
		// TODO Auto-generated method stub
		RowBounds rowbounds = new RowBounds(0,5);
		return session.selectList("notice.selectMainNoticeList",null,rowbounds);
	}

}
