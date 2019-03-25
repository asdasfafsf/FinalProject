package com.spring.test.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.test.admin.model.vo.Notice;

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
	@Override
	public int insertNotice(Notice n) {
		// TODO Auto-generated method stub
		return session.insert("admin.insertNotice",n);
	}
	@Override
	public List<Map<String, String>> selectNoticeContent(int noticeNo) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectNoticeContent",noticeNo);
	}
	@Override
	public int updateNotice(Notice n) {
		// TODO Auto-generated method stub
		return session.update("admin.updateNotice",n);
	}

}
