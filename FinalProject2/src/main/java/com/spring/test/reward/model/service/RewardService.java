package com.spring.test.reward.model.service;

import java.util.List;
import java.util.Map;

public interface RewardService {

	int selectNextRewardNo();

	List<Map<String, Object>> selectRewardCategoryList();

	int selectCurRewardNo();

	int createProjectReward(Map<String, Object> basicInfo);

	int updateRewardBasicInfo(Map<String, Object> param);

}
