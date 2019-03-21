package com.spring.test.admin.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.test.admin.model.vo.RewardAd;

public interface AdminService {
	List<Map<String,String>> selectNoticeList(int cPage, int numPerPage);
	int selectNoticeCount();
	List<Map<String,String>> selectSearchNoticeList(int cPage, int numPerPage, String word);
	int selectSearchNoticeCount(String word);
	int deleteNoticeList(List noticeNoList);
	
	List<Map<String,String>> selectEventList(int cPage, int numPerPage);
	int selectEventCount();
	List<Map<String,String>> selectSearchEventList(int cPage, int numPerPage, String word);
	int selectSearchEventList(String word);
	int deleteEventList(List eventNoList);
	
	List<Map<String,String>> selectRewardIndexList(int cPage, int numPerPage);
	int selectRewardIndexCount();
	int stopRewardList(List rewardNoList);
	int deleteRewardList(List rewardNoList);
	
	List<Map<String,String>> selectRewardStopList(int cPage, int numPerPage);
	int selectRewardStopCount();
	
	List<Map<String,String>> selectRewardAdList(int cPage, int numPerPage);
	int selectRewardAdCount();
	
	int insertRewardAd(RewardAd ra);
	
}
