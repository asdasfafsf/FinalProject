package com.spring.test.admin.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	SqlSessionTemplate session;
	//공지사항
	@Override
	public List<Map<String, String>> selectNoticeList(int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("admin.selectNoticeList",null,rb);
	}

	@Override
	public int selectNoticeCount() {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectNoticeCount");
	}
	//공지사항 검색
	@Override
	public List<Map<String, String>> selectSearchNoticeList(int cPage, int numPerPage, String word) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("admin.selectSearchNoticeList",word,rb);
	}
	
	@Override
	public int selectSearchNoticeCount(String word) {
		// TODO Auto-generated method stub
		System.out.println("dao"+word);
		return session.selectOne("admin.selectSearchNoticeCount",word);
	}
	//공지사항 삭제
	@Override
	public int deleteNoticeList(List noticeNoList) {
		// TODO Auto-generated method stub
		System.out.println("dao"+noticeNoList);
		return session.delete("admin.deleteNoticeList",noticeNoList);
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
	public List<Map<String, String>> selectRewardIndexList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("admin.selectRewardIndexList",null,rb);
	}

	@Override
	public int selectRewardIndexCount() {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectRewardIndexCount");
	}

	@Override
	public List<Map<String, String>> selectRewardStopList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("admin.selectRewardStopList",null,rb);
	}

	@Override
	public int selectRewardStopCount() {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectRewardStopCount");
	}


	
}
