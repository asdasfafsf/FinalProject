package com.spring.test.reward.model.service;

import java.util.List;
import java.util.Map;

import com.spring.test.reward.model.vo.RewardItem;

public interface RewardService {

	int selectNextRewardNo();

	List<Map<String, Object>> selectRewardCategoryList();

	int selectCurRewardNo();

	int createProjectReward(Map<String, Object> basicInfo);

	int updateRewardBasicInfo(Map<String, Object> param);

	int insertRewardItem(RewardItem rewardItem);

}
