package com.spring.test.reward.model.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.test.reward.model.dao.RewardDao;
import com.spring.test.reward.model.vo.Reward;
import com.spring.test.reward.model.vo.RewardItem;
import com.spring.test.reward.model.vo.RewardItemInputOption;
import com.spring.test.reward.model.vo.RewardItemSelectOption;

@Service
public class RewardServiceImpl implements RewardService{
	@Autowired
	RewardDao dao;
	
	@Override
	@Transactional
	public int selectNextRewardNo() {
		
		return dao.selectNextRewardNo();
	}
	
	@Override
	@Transactional
	public List<Map<String, Object>> selectRewardCategoryList() {
		return dao.selectRewardCategory();
	}
	
	@Override
	@Transactional
	public int createProjectReward(Map<String, Object> basicInfo) {
		int result = dao.createProjectReward(basicInfo);
		
		return result;
	}
	
	@Override
	@Transactional
	public int selectCurRewardNo() {
		return dao.selectCurRewardNo();
	}
	
	@Override
	@Transactional
	public int updateRewardBasicInfo(Map<String, Object> param) {
		return dao.updateRewardBasicInfo(param);
	}
	
	@Override
	@Transactional
	public int insertRewardItem(RewardItem rewardItem) {
		dao.insertRewardItem(rewardItem);	
		rewardItem.setSelectOptionList(rewardItem.getSelectOptionList());
		rewardItem.setInputOptionList(rewardItem.getInputOptionList());
				
		if (rewardItem.getSelectOptionList().size() > 0) {
			for (RewardItemSelectOption selectOption : rewardItem.getSelectOptionList()) {
				dao.insertRewardSelectOption(selectOption);
			}
		}
		
		if (rewardItem.getInputOptionList().size() > 0) {			
			for (RewardItemInputOption inputOption : rewardItem.getInputOptionList()) {
				dao.insertRewardInputOption(inputOption);
			}
		}
		
		return rewardItem.getNo();
	}
	
	@Override
	@Transactional
	public int updateRewardItem(RewardItem rewardItem) {
		List<RewardItemSelectOption> selectOptionList = rewardItem.getSelectOptionList();
		List<RewardItemInputOption> inputOptionList = rewardItem.getInputOptionList();
		
		for (RewardItemSelectOption selectOption : selectOptionList) {
			if (selectOption.getNo() == 0) {
				dao.insertRewardSelectOption(selectOption);
			} else {
				dao.updateRewardSelectOption(selectOption);
			}
		}
		
		for (RewardItemInputOption inputOption : inputOptionList) {
			if (inputOption.getNo() == 0) {
				dao.insertRewardInputOption(inputOption);
			} else {
				dao.updateRewardInputOption(inputOption);
			}
		}
		
		if (selectOptionList != null && selectOptionList.size() > 0) {
			dao.deleteRewardSelectOption(selectOptionList);
		}
		
		if (inputOptionList != null && inputOptionList.size() > 0) {
			dao.deleteRewardInputOption(inputOptionList);
		}
		
		
		return 1;
	}
	
	@Override
	@Transactional
	public Reward selectReward(int rewardNo) {
		return dao.selectReward(rewardNo);
	}
	
	@Override
	@Transactional
	public int deleteRewardItem(int itemNo) {
		return dao.deleteRewardItem(itemNo);
	}
	
	@Override
	@Transactional
	public Reward getRewardStoryInfo(int rewardNo) {
		Reward reward = null;
		
		return reward;
	}
	
	@Override
	@Transactional
	public Reward getRewardNoticeInfo(int rewardNo) {
		Reward reward = null;
		
		return reward;
	}
	
	@Override
	@Transactional
	public Reward getRewardCommentInfo(int rewardNo) {
		Reward reward = null;
		
		return reward;
	}
	
	
	
}
