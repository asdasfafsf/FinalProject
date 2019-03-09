package com.spring.test.reward.service;

import java.util.List;
import java.util.Map;

public interface RewardService {

	int selectNextRewardNo();

	List<Map<String, Object>> selectRewardCategoryList();

	int createProjectReward(int userNo);

}
