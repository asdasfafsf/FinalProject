package com.spring.test.reward.dao;

import java.util.List;
import java.util.Map;

public interface RewardDao {

	List<Map<String, Object>> selectRewardCategory();

	int insertProjectReward(int userNo);

}
