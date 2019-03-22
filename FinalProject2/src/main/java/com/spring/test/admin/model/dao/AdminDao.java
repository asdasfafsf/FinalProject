package com.spring.test.admin.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.test.admin.model.vo.Notice;
import com.spring.test.admin.model.vo.RewardAd;


public interface AdminDao {
	List<Map<String,String>> selectNoticeList(int cPage,int numPerPage);
	int selectNoticeCount();
	List<Map<String,String>> selectSearchNoticeList(int cPage, int numPerPage, String word);
	int selectSearchNoticeCount(String word);
	int deleteNoticeList(List noticeNoList);
	int insertNotice(Notice n);
	List<Map<String,String>> selectNoticeContent(int noticeNo);
	int updateNotice(Notice n);
	
	List<Map<String,String>> selectEventList(int cPage, int numPerPage);
	int selectEventCount();
	int deleteEventList(List eventNoList);
	List<Map<String,String>> selectEventContent(int eventNo);
	int insertEvent(Map<String, String> event);

	
	
	List<Map<String,String>> selectRewardIndexList(int cPage, int numPerPage);
	int selectRewardIndexCount();
	int stopRewardList(List rewardNoList);
	int deleteRewardList(List rewardNoList);
	
	
	List<Map<String,String>> selectRewardStopList(int cPage, int numPerPage);
	int selectRewardStopCount();
	
	List<Map<String,String>> selectRewardAdList(int cPage, int numPerPage);
	int selectRewardAdCount();
	int insertRewardAd(RewardAd ra);
	int deleteRewardAdList(List rewardAdNoList);
	
	List<Map<String,String>> selectRewardAppList(int cPage,int numPerPage);
	int selectRewardAppCount();
	
	List<Map<String,String>> selectRewardOpenScheduleList(int cPage, int numPerPage);
	int selectRewardOpenScheduleCount();
	
	List<Map<String,String>> selectMemberList(int cPage, int numPerPage);
	int selectMemberCount();
	int withdrawalMemberList(List memberNoList);
	int suspendMemberList(List memberNoList);
	int suspendCancelMemberList(List memberNoList);
}
