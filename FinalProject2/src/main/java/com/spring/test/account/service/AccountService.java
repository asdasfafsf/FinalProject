package com.spring.test.account.service;

import java.util.List;
import java.util.Map;

public interface AccountService {
	List<Map<String, Object>> selectRewardAccount(int rewardNo);
	int updateRewardAccount(Map<String, Object> param);
	List<Map<String, Object>> selectLoadUserAccount(int userNo);
	int updateUserAccount(Map<String,Object> param);
	List<Map<String, Object>> selectWithdrawalUser(int rewardNo);
	int updateSuccessWithdrawalUser(int reward_support_no);
	int updateFailWithdrawalUser(int reward_support_no);
	List<Map<String, Object>> selectDepositUser(int rewardNo);
}
