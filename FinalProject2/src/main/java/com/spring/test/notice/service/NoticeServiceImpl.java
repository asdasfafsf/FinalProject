package com.spring.test.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.test.notice.dao.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDao dao;
	
	@Override
	public List<Map<String, String>> selectMainNoticeList() {
		// TODO Auto-generated method stub
		return dao.selectMainNoticeList();
	}

}
