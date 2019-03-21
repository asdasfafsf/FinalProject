package com.spring.test.account.dao;

import java.util.Map;

public interface AccountDao {
	int deleteRewardAccount(Map<String, Object> param);
	int insertRewardAccount(Map<String, Object> param);
}
