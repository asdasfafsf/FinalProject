package com.spring.test.reward.model.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.test.reward.model.dao.RewardDao;
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
		return 1;
	}
	
}
