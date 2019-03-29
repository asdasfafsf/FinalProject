package com.spring.test.reward.model.service;

import java.util.List;
import java.util.Map;

import com.spring.test.reward.model.vo.Reward;
import com.spring.test.reward.model.vo.RewardItem;
import com.spring.test.reward.model.vo.RewardReport;
import com.spring.test.reward.model.vo.RewardSupport;

public interface RewardService {

	int selectNextRewardNo();

	List<Map<String, Object>> selectRewardCategoryList();

	int selectCurRewardNo();

	int createProjectReward(Map<String, Object> basicInfo);

	int updateRewardBasicInfo(Map<String, Object> param);

	Reward selectReward(int rewardNo);

	int insertRewardItem(RewardItem rewardItem);

	int deleteRewardItem(int itemNo);

	int updateRewardItem(RewardItem rewardItem);

	int updateRewardStoryContentList(Reward reward);

	Reward getRewardCommentInfo(Map<String, Object> param);

	int insertRewardComment(Map<String, Object> param);

	List<Map<String, Object>> insertRewardRecomment(Map<String, Object> param);

	List<Map<String, Object>> reloadRewardRecomment(Map<String, Object> param);

	List<Map<String, Object>> reloadRewardComment(Map<String, Object> param);

	Reward getRewardNoticeInfo(Map<String, Object> param);

	Reward getRewardStoryInfo(Map<String, Object> param);

	Map<String, Object> clickRewardLike(Map<String, Object> param);

	Map<String, Object> selectRewardPaymentInfo(Map<String, Object> param);

	int insertRewardSupport(RewardSupport rewardSupport);

	Map<String, Object> selectRewardAddress(Map<String, Object> param);

	int updateRewardState(int rewardNo, int rewardState);

	int deleteComment(Map<String, Object> param);

	int deleteRecomment(Map<String, Object> param);
	
	int insertRewardReport(RewardReport r);

	Reward getRewardStoryInfoPreview(Map<String, Object> param);


	List<Map<String, Object>> selectSupporterBasicInfo(int rewardNo);

	int selectSupportNum(int rewardNo);


	List<Map<String, Object>> selectSupporterBasicInfo(Map<String, Object> param);

	Map<String, Object> selectRewardSupportInfo(Map<String, Object> param);

	int selectRewardSupportCountBasic(Map<String, Object> param);

	int setRewardSupportDelivery(Map<String, Object> param);

	int updateRewardSupportDeliveryCount(Map<String, Object> param);

}