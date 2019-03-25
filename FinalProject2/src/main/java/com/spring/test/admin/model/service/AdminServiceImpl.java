package com.spring.test.admin.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.test.admin.model.dao.AdminDao;
import com.spring.test.admin.model.vo.Event;
import com.spring.test.admin.model.vo.MemberSort;
import com.spring.test.admin.model.vo.Notice;
import com.spring.test.admin.model.vo.RewardAd;
@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao dao;
	//공지사항
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

	@Override
	public List<Map<String, String>> selectRewardIndexList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectRewardIndexList(cPage,numPerPage);
	}

	@Override
	public int selectRewardIndexCount() {
		// TODO Auto-generated method stub
		return dao.selectRewardIndexCount();
	}
	@Override
	public int stopRewardList(List rewardNoList) {
		// TODO Auto-generated method stub
		return dao.stopRewardList(rewardNoList);
	}
	@Override
	public int deleteRewardList(List rewardNoList) {
		// TODO Auto-generated method stub
		return dao.deleteRewardList(rewardNoList);
	}

	@Override
	public List<Map<String, String>> selectRewardStopList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectRewardStopList(cPage, numPerPage);
	}

	@Override
	public int selectRewardStopCount() {
		// TODO Auto-generated method stub
		return dao.selectRewardStopCount();
	}

	@Override
	public List<Map<String, String>> selectRewardAdList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectRewardAdList(cPage, numPerPage);
	}

	@Override
	public int selectRewardAdCount() {
		// TODO Auto-generated method stub
		return dao.selectRewardAdCount();
	}

	@Override
	public int insertRewardAd(RewardAd ra) {
		// TODO Auto-generated method stub
		return dao.insertRewardAd(ra);
	}

	@Override
	public int deleteRewardAdList(List rewardAdNoList) {
		// TODO Auto-generated method stub
		return dao.deleteRewardAdList(rewardAdNoList);
	}
	@Override
	public List<Map<String, String>> selectRewardAppList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectRewardAppList(cPage,numPerPage);
	}
	
	@Override
	public int selectRewardAppCount() {
		// TODO Auto-generated method stub
		return dao.selectRewardAppCount();
	}
	@Override
	public List<Map<String, String>> selectRewardOpenScheduleList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectRewardOpenScheduleList(cPage, numPerPage);
	}

	@Override
	public int selectRewardOpenScheduleCount() {
		// TODO Auto-generated method stub
		return dao.selectRewardOpenScheduleCount();
	}

	@Override
	public List<Map<String, String>> selectMemberList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectMemberList(cPage, numPerPage);
	}

	@Override
	public int selectMemberCount() {
		// TODO Auto-generated method stub
		return dao.selectMemberCount();
	}

	@Override
	public int withdrawalMemberList(List memberNoList) {
		// TODO Auto-generated method stub
		return dao.withdrawalMemberList(memberNoList);
	}

	@Override
	public int suspendMemberList(List memberNoList) {
		// TODO Auto-generated method stub
		return dao.suspendMemberList(memberNoList);
	}

	@Override
	public int suspendCancelMemberList(List memberNoList) {
		// TODO Auto-generated method stub
		return dao.suspendCancelMemberList(memberNoList);
	}

	@Override
	public int selectMemberSortCount(MemberSort ms) {
		// TODO Auto-generated method stub
		return dao.selectMemberSortCount(ms);
	}

	@Override
	public List<Map<String, String>> selectMemberSortList(int cPage, int numPerPage, MemberSort ms) {
		// TODO Auto-generated method stub
		return dao.selectMemberSortList(cPage,numPerPage,ms);
	}

	@Override
	public int openRewardList(List rewardNoList) {
		// TODO Auto-generated method stub
		return dao.openRewardList(rewardNoList);
	}






	






}
