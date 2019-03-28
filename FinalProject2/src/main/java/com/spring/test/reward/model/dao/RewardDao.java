package com.spring.test.reward.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.spring.test.reward.model.vo.Reward;
import com.spring.test.reward.model.vo.RewardAccount;
import com.spring.test.reward.model.vo.RewardComment;
import com.spring.test.reward.model.vo.RewardItem;
import com.spring.test.reward.model.vo.RewardItemInputOption;
import com.spring.test.reward.model.vo.RewardItemSelectOption;
import com.spring.test.reward.model.vo.RewardReport;
import com.spring.test.reward.model.vo.RewardStoryContent;
import com.spring.test.reward.model.vo.RewardSupport;
import com.spring.test.reward.model.vo.RewardSupportAddress;
import com.spring.test.reward.model.vo.RewardSupportItem;
import com.spring.test.reward.model.vo.RewardSupportItemInputOption;

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

	int insertRewardStoryContent(RewardStoryContent rewardStoryContent);

	int deleteRewardStoryContent(int rewardNo);

	List<RewardStoryContent> selectRewardContentList(int rewardNo);

	List<RewardItem> selectRewardItemList(int rewardNo);

	List<RewardComment> selectRewardCommentList(Map<String, Object> param);

	List<RewardComment> selectRewardReCommentList(int commentNo, int offset);

	int insertRewardComment(Map<String, Object> param);

	int insertRewardRecomment(Map<String, Object> param);

	List<Map<String, Object>> selectRewardRecommentList(Map<String, Object> param, RowBounds rowBounds);

	List<Map<String, Object>> selectRewardCommentListMap(Map<String, Object> param, RowBounds rowBounds);

	Reward selectOnlyReward(Map<String, Object> param);

	int selectRewardLikeUser(Map<String, Object> param);

	int deleteRewardLike(Map<String, Object> param);

	int insertRewardLike(Map<String, Object> param);

	int selectRewardLikeNum(Map<String, Object> param);

	int updateRewardItem(RewardItem rewardItem);

	RewardItem selectRewardItemReamin(int itemNo);

	int insertRewardSupport(RewardSupport rewardSupport);

	int insertRewardSupportItem(RewardSupportItem rewardSupportItem);

	int insertRewardDelivery(RewardSupportAddress supportAddr);

	int insertRewardAccount(RewardAccount account);

	int insertRewardSupportItemInputOption(RewardSupportItemInputOption S);

	Map<String, Object> selectRewardAddress(Map<String, Object> param);

	int updateRewardState(Map<String, Object> param);

	int deleteComment(Map<String, Object> param);

	int deleteRecomment(Map<String, Object> param);
	
	int insertRewardReport(RewardReport r);

	Reward selectOnlyRewardPreview(Map<String, Object> param);


	int updateStateOpenSchedule();

	int updateRewardOpen();

	int updateOpenScheduleRewardOpen();

	int updateRewardSuccess();

	int updateRewardFail();
	
	
}
