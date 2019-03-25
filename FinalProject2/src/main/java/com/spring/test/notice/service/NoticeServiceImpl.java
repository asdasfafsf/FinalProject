package com.spring.test.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.test.admin.model.vo.Notice;
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
	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectNoticeList(cPage,numPerPage);
	}

	@Override
	public int selectNoticeCount() {
		// TODO Auto-generated method stub
		return dao.selectNoticeCount();
	}
	//공지사항 검색
	@Override
	public List<Map<String, String>> selectSearchNoticeList(int cPage, int numPerPage, String word) {
		// TODO Auto-generated method stub
		return dao.selectSearchNoticeList(cPage, numPerPage, word);
	}
	
	@Override
	public int selectSearchNoticeCount(String word) {
		// TODO Auto-generated method stub
		return dao.selectSearchNoticeCount(word);
	}
	
	//공지사항 삭제
	@Override
	public int deleteNoticeList(List noticeNoList) {
		// TODO Auto-generated method stub
		return dao.deleteNoticeList(noticeNoList);
	}
	@Override
	public int insertNotice(Notice n) {
		// TODO Auto-generated method stub
		return dao.insertNotice(n);
	}
	@Override
	public List<Map<String, String>> selectNoticeContent(int noticeNo) {
		// TODO Auto-generated method stub
		return dao.selectNoticeContent(noticeNo);
	}
	
	@Override
	public int updateNotice(Notice n) {
		// TODO Auto-generated method stub
		return dao.updateNotice(n);
	}

}
