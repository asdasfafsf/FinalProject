package com.spring.test.reward.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.test.reward.model.vo.Reward;
import com.spring.test.reward.model.vo.RewardItem;
import com.spring.test.reward.model.vo.RewardItemInputOption;
import com.spring.test.reward.model.vo.RewardItemSelectOption;

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
}


