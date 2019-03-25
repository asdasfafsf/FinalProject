package com.spring.test.admin2.model.dao;

import java.util.List;
import java.util.Map;

import com.spring.test.admin2.model.vo.AdminUser;
import com.spring.test.admin2.model.vo.RewardSort;

public interface Admin2Dao {
	List<Map<String,String>> selectAdminList(int cPage,int numPerPage);
	int selectAdminCount();
	int deleteAdmin(int userNo);
	int checkId(String email);
	int insertAdmin(AdminUser au);
	int selectSearchAdminCount(String word);
	List<Map<String, String>> selectSearchAdminList(int cPage, int numPerPage, String word);
	
	int selectRewardContinueSortCount(RewardSort rs);
	List<Map<String, String>> selectRewardContinueSortList(int cPage, int numPerPage, RewardSort rs);
	

}
