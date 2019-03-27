package com.spring.test.reward.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.test.reward.model.vo.Reward;
import com.spring.test.reward.model.vo.RewardComment;
import com.spring.test.reward.model.vo.RewardItem;
import com.spring.test.reward.model.vo.RewardItemInputOption;
import com.spring.test.reward.model.vo.RewardItemSelectOption;
import com.spring.test.reward.model.vo.RewardStoryContent;
import com.spring.test.reward.model.vo.*;

@Repository
public class RewardDaoImpl implements RewardDao{
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Map<String,Object>>selectRewardCategory() {
		return session.selectList("reward.selectRewardCategoryMap");
	}
	
	
	@Override
	public int selectCurRewardNo() {
		return session.selectOne("reward.selectCurRewardNo");
	}
	
	@Override
	public int selectNextRewardNo() {
		return session.selectOne("reward.selectNextRewardNo");
	}
	
	@Override
	public int createProjectReward(Map<String, Object> param) {
		return session.insert("reward.insertProjectReward", param);
	}
	
	@Override
	public int updateRewardBasicInfo(Map<String, Object> param) {
		return session.update("reward.updateProjectRewardBasicInfo", param);
	}
	
	
	@Override
	public Reward selectReward(int rewardNo) {
		return session.selectOne("reward.selectReward", rewardNo);
	}
	
	@Override
	public int insertRewardItem(RewardItem rewardItem) {
		return session.insert("reward.insertRewardItem", rewardItem);
	}
	
	@Override
	public int updateRewardItem(RewardItem rewardItem) {
		return session.update("reward.updateRewardItem", rewardItem);
	}
	
	
	@Override
	public int insertRewardSelectOptionList(List<RewardItemSelectOption> rewardItemSelectOptionList) {
		return session.insert("reward.insertRewardItemSelectOptionList", rewardItemSelectOptionList);
	}
	
	@Override
	public int insertRewardSelectOption(RewardItemSelectOption selectOption) {
		return session.insert("reward.insertRewardItemSelectOption",selectOption);
	}
	
	@Override
	public int updateRewardSelectOption(RewardItemSelectOption selectOption) {
		return session.update("reward.updateRewardItemSelectOption", selectOption);
	}
	
	@Override
	public int deleteRewardSelectOption(List<RewardItemSelectOption> selectOptionList) {
		return session.delete("reward.deleteRewardItemSelectOption", selectOptionList);
	}
	
	@Override
	public int insertRewardInputOptionList(List<RewardItemInputOption> rewardItemInputOptionList) {
		return session.insert("reward.insertRewardItemInputOptionList", rewardItemInputOptionList);
	}
	
	@Override
	public int insertRewardInputOption(RewardItemInputOption inputOption) {
		return session.insert("reward.insertRewardItemInputOption", inputOption);
	}
	
	@Override
	public int updateRewardInputOption(RewardItemInputOption inputOption) {
		return session.update("reward.updateRewardItemInputOption", inputOption);
	}
	
	@Override
	public int deleteRewardInputOption(List<RewardItemInputOption> inputOptionList) {
		return session.delete("reward.deleteRewardItemInputOption", inputOptionList);
	}
	
	@Override
	public int deleteRewardItem(int itemNo) {
		return session.delete("reward.deleteRewardItem", itemNo);
	}
	
	@Override
	public int deleteRewardStoryContent(int rewardNo) {
		return session.delete("reward.deleteRewardStoryContent", rewardNo);
	}
	
	@Override
	public int insertRewardStoryContent(RewardStoryContent rewardStoryContent) {
		return session.insert("reward.insertRewardStoryContent", rewardStoryContent);
	}
	
	@Override
	public Reward selectOnlyReward(Map<String, Object> param) {
		return session.selectOne("rewardView.selectReward", param);
	}
	
	@Override
	public List<RewardStoryContent> selectRewardContentList(int rewardNo) {
		return session.selectList("rewardView.selectRewardStoryContent", rewardNo);
	}
	
	@Override
	public List<RewardItem> selectRewardItemList(int rewardNo) {
		return session.selectList("rewardView.selectRewardItem", rewardNo);
	}
	
	@Override
	public List<RewardComment> selectRewardCommentList(Map<String, Object> param) {
		int limit = 5;
		int offset = param.get("offset") != null ? Integer.parseInt(param.get("offset").toString()) : 0;
		RowBounds rowBounds = new RowBounds(offset,limit);
	
		
		return session.selectList("rewardView.selectRewardComment", param, rowBounds);
	}
	
	@Override
	public List<RewardComment> selectRewardReCommentList(int commentNo, int offset) {
		int limit = 5;
		RowBounds rowBounds = new RowBounds(offset,limit);
	
		
		return session.selectList("rewardView.selectRewardRecomment", commentNo, rowBounds);
	}
	
	@Override
	public int insertRewardComment(Map<String, Object> param) {
		return session.insert("reward.insertRewardComment", param);
	}
	
	@Override
	public int insertRewardRecomment(Map<String, Object> param) {
		return session.insert("reward.insertRewardRecomment", param);
	}
	
	@Override
	public List<Map<String, Object>> selectRewardRecommentList(Map<String, Object> param, RowBounds rowBounds) {
		return session.selectList("rewardView.selectRewardRecommentMap", param, rowBounds);
	}
	
	@Override
	public List<Map<String, Object>> selectRewardCommentListMap(Map<String, Object> param, RowBounds rowBounds) {
		return session.selectList("rewardView.selectRewardCommentMap", param, rowBounds);
	}
	
	@Override
	public int selectRewardLikeUser(Map<String, Object> param) {
		return session.selectOne("rewardView.selectRewardLikeUser", param);
	}
	
	@Override
	public int insertRewardLike(Map<String, Object> param) {
		return session.insert("reward.insertRewardLike", param);
	}
	
	@Override
	public int deleteRewardLike(Map<String, Object> param) {
		return session.delete("reward.deleteRewardLike", param);
	}
	
	@Override
	public int selectRewardLikeNum(Map<String, Object> param) {
		return session.selectOne("rewardView.selectRewardLikeNum", param);
	}
	
	@Override
	public RewardItem selectRewardItemReamin(int itemNo) {
		return session.selectOne("rewardView.selectRewardItemRemain", itemNo);
	}
	
	@Override
	public int insertRewardSupport(RewardSupport rewardSupport) {
		return session.insert("reward.insertRewardSupport", rewardSupport);
	}
	
	@Override
	public int insertRewardSupportItem(RewardSupportItem rewardSupportItem) {
		return session.insert("reward.insertRewardSupportItem", rewardSupportItem);
	}
	
	@Override
	public int insertRewardSupportItemInputOption(RewardSupportItemInputOption inputOption) {
		return session.insert("reward.insertRewardSupportItemInputOption", inputOption);
	}
	
	@Override
	public int insertRewardDelivery(RewardSupportAddress supportAddr) {
		return session.insert("reward.insertRewardDelivery", supportAddr);
	}
	
	@Override
	public int insertRewardAccount(RewardAccount account) {
		return session.insert("reward.insertRewardAccount", account);
	}
	
	@Override
	public Map<String, Object> selectRewardAddress(Map<String, Object> param) {
		return session.selectOne("rewardView.selectUserAddress", param);
	}
	
	@Override
	public int updateRewardState(Map<String, Object> param) {
		return session.update("reward.updateRewardState", param);
	}
	
	@Override
	public int deleteComment(Map<String, Object> param) {
		return session.update("reward.deleteRewardComment", param);
	}
	
	@Override
	public int deleteRecomment(Map<String, Object> param) {
		return session.update("reward.deleteRewardRecomment", param);
	}
}


