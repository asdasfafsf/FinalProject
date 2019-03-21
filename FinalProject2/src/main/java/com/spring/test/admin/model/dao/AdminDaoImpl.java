package com.spring.test.admin.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.test.admin.model.vo.Notice;
import com.spring.test.admin.model.vo.RewardAd;

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
	public int stopRewardList(List rewardNoList) {
		// TODO Auto-generated method stub
		return session.update("admin.stopRewardList",rewardNoList);
	}
	@Override
	public int deleteRewardList(List rewardNoList) {
		// TODO Auto-generated method stub
		return session.delete("admin.deleteRewardList",rewardNoList);
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

	@Override
	public List<Map<String, String>> selectRewardAdList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("admin.selectRewardAdList",null,rb);
	}

	@Override
	public int selectRewardAdCount() {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectRewardAdCount");
	}

	@Override
	public int insertRewardAd(RewardAd ra) {
		// TODO Auto-generated method stub
		return session.insert("admin.insertRewardAd",ra);
	}

	@Override
	public int deleteRewardAdList(List rewardAdNoList) {
		// TODO Auto-generated method stub
		return session.delete("admin.deleteRewardAd",rewardAdNoList);
	}
	@Override
	public List<Map<String, String>> selectRewardAppList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("admin.selectRewardAppList",null,rb);
	}
	
	@Override
	public int selectRewardAppCount() {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectRewardAppCount");
	}
	@Override
	public List<Map<String, String>> selectRewardOpenScheduleList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("admin.selectRewardOpenScheduleList",null,rb);
	}

	@Override
	public int selectRewardOpenScheduleCount() {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectRewardOpenScheduleCount");
	}

	@Override
	public List<Map<String, String>> selectMemberList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("admin.selectMemberList",null,rb);
	}

	@Override
	public int selectMemberCount() {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectMemberCount");
	}

	@Override
	public int withdrawalMemberList(List memberNoList) {
		// TODO Auto-generated method stub
		return session.update("admin.withdrawalMemberList", memberNoList);
	}

	@Override
	public int suspendMemberList(List memberNoList) {
		// TODO Auto-generated method stub
		return session.update("admin.suspendMemberList", memberNoList);
	}

	@Override
	public int suspendCancelMemberList(List memberNoList) {
		// TODO Auto-generated method stub
		return session.update("admin.suspendCancelMemberList",memberNoList);
	}



	


	



	
}
