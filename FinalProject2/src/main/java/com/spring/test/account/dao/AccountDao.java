package com.spring.test.account.dao;

import java.util.List;
import java.util.Map;

public interface AccountDao {
	List<Map<String, Object>> selectRewardAccount(int rewardNo);
	int deleteRewardAccount(Map<String, Object> param);
	int insertRewardAccount(Map<String, Object> param);
	List<Map<String, Object>> selectLoadUserAccount(int userNo);
}
