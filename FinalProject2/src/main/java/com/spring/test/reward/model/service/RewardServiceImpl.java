package com.spring.test.reward.model.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.test.reward.model.dao.RewardDao;
import com.spring.test.reward.model.vo.Reward;
import com.spring.test.reward.model.vo.RewardItem;

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
		System.out.println(rewardItem);
		System.out.println(rewardItem.getNo() + "안녕!!");
		
		dao.insertRewardItem(rewardItem);
		rewardItem.setSelectOptionList(rewardItem.getSelectOptionList());
		rewardItem.setInputOptionList(rewardItem.getInputOptionList());
		
		if (rewardItem.getSelectOptionList().size() > 0) {
			dao.insertRewardSelectOptionList(rewardItem.getSelectOptionList());
		}
		
		if (rewardItem.getInputOptionList().size() > 0) {
			dao.insertRewardInputOptionList(rewardItem.getInputOptionList());
		}
		
		return rewardItem.getNo();
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
	
}
