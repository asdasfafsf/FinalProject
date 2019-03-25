package com.spring.test.admin2.model.service;

import java.util.List;
import java.util.Map;

import com.spring.test.admin2.model.vo.AdminUser;
import com.spring.test.admin2.model.vo.RewardSort;

public interface Admin2Service {

	List<Map<String,String>> selectAdminList(int cPage, int numPerPage);
	int selectAdminCount();
	int deleteAdmin(int userNo);
	int checkId(String email);
	int insertAdmin(AdminUser au);
	int selectSearchAdminCount(String word);
	List<Map<String, String>> selectSearchAdminList(int cPage, int numPerPage, String word);
	
	List<Map<String,String>> selectRewardContinueSortList(int cPage,int numPerPage, RewardSort rs);
	int selectRewardContinueSortCount(RewardSort rs);
	
	List<Map<String,String>> selectRewardStopSortList(int cPage, int numPerPage, RewardSort rs);
	int selectRewardStopSortCount(RewardSort rs);
	
	List<Map<String,String>> selectRewardAppSortList(int cPage, int numPerPage, RewardSort rs);
	int selectRewardAppSortCount(RewardSort rs);
	
	
	List<Map<String,String>> selectReportList(int cPage, int numPerPage, List list);
	int selectReportCount(List list);
}
