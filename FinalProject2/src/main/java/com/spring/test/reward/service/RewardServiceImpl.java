package com.spring.test.reward.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.test.reward.dao.RewardDao;

@Service
public class RewardServiceImpl implements RewardService{
	@Autowired
	RewardDao dao;
	
	@Override
	@Transactional
	public int selectNextRewardNo() {
		
		return 1;
	}
	
	@Override
	@Transactional
	public List<Map<String, Object>> selectRewardCategoryList() {
		return dao.selectRewardCategory();
	}
	
	@Override
	public int createProjectReward(int userNo) {
		return  dao.insertProjectReward(userNo);
	}
	
}
