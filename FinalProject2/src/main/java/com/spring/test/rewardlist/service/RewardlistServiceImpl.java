package com.spring.test.rewardlist.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.test.rewardlist.dao.RewardlistDao;

@Service
public class RewardlistServiceImpl implements RewardlistService {
	
	@Autowired
	RewardlistDao dao;

	@Override
	public List<Map<String, String>> selectRewardList(int cPage,Map<String,Integer> rewardListFilter) {
		// TODO Auto-generated method stub
		return dao.selectRewardList(cPage,rewardListFilter);
	}
	

	
}
