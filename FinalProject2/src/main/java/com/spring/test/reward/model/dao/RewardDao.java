package com.spring.test.reward.model.dao;

import java.util.List;
import java.util.Map;

import com.spring.test.reward.model.vo.Reward;
import com.spring.test.reward.model.vo.RewardItem;
import com.spring.test.reward.model.vo.RewardItemInputOption;
import com.spring.test.reward.model.vo.RewardItemSelectOption;

public interface RewardDao {

	List<Map<String, Object>> selectRewardCategory();

	int selectCurRewardNo();

	int selectNextRewardNo();

	int createProjectReward(Map<String, Object> param);

	int updateRewardBasicInfo(Map<String, Object> param);

	int insertRewardItem(RewardItem rewardItem);

	int insertRewardSelectOptionList(List<RewardItemSelectOption> rewardItemSelectOptionList);

	int insertRewardInputOptionList(List<RewardItemInputOption> rewardItemInputOptionList);

	Reward selectReward(int rewardNo);

	int deleteRewardItem(int itemNo);

	int insertRewardSelectOption(RewardItemSelectOption selectOption);

	int insertRewardInputOption(RewardItemInputOption inputOption);

	int updateRewardSelectOption(RewardItemSelectOption selectOption);

	int updateRewardInputOption(RewardItemInputOption inputOption);

	int deleteRewardInputOption(List<RewardItemInputOption> inputOptionList);

	int deleteRewardSelectOption(List<RewardItemSelectOption> selectOptionList);

}
