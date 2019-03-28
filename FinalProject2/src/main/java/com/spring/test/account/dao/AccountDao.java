package com.spring.test.account.dao;

import java.util.List;
import java.util.Map;

public interface AccountDao {
	List<Map<String, Object>> selectRewardAccount(int rewardNo);
	int deleteRewardAccount(Map<String, Object> param);
	int insertRewardAccount(Map<String, Object> param);
	List<Map<String, Object>> selectLoadUserAccount(int userNo);
	int deleteUserAccount(Map<String, Object> param);
	int insertUserAccount(Map<String, Object> param);
	List<Map<String, Object>> selectWithdrawalUser(int rewardNo);
	int updateSuccessWithdrawalUser(int reward_support_no);
	int updateFailWithdrawalUser(int reward_support_no);
	List<Map<String, Object>> selectDepositUser(int rewardNo);
	int updateSupportToken(Map<String,Object> param);
	int updateRewardToken(Map<String,Object> param);
	int updateUserToken(Map<String,Object> param);
}
