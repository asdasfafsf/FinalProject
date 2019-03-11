package com.spring.test.reward.model.dao;

import java.util.List;
import java.util.Map;

public interface RewardDao {

	List<Map<String, Object>> selectRewardCategory();

	int selectCurRewardNo();

	int selectNextRewardNo();

	int createProjectReward(Map<String, Object> param);

	int updateRewardBasicInfo(Map<String, Object> param);

}
