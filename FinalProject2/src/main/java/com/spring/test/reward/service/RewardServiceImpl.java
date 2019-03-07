package com.spring.test.reward.service;

import org.springframework.stereotype.Service;

@Service
public class RewardServiceImpl implements RewardService{

	@Override
	public int selectNextRewardNo() {
		
		return 1;
	}
	
}
