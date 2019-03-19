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

	@Override
	public List<Map<String, String>> rewardRankList() {
		// TODO Auto-generated method stub
		return dao.rewardRankList();
	}

	@Override
	public List<Map<String, String>> open_schedule_rewardRankList() {
		// TODO Auto-generated method stub
		return dao.open_schedule_rewardRankList();
	}

	@Override
	public List<Map<String, String>> newest_open_schedule_rewardList() {
		// TODO Auto-generated method stub
		return dao.newest_open_schedule_rewardList();
	}

	@Override
	public List<Map<String, String>> deadline_approaching_rewardList() {
		// TODO Auto-generated method stub
		return dao.deadline_approaching_rewardList();
	}

	@Override
	public List<Map<String, String>> new_rewardList() {
		// TODO Auto-generated method stub
		return dao.new_rewardList();
	}

	@Override
	public List<Map<String, String>> selectSearchRewardList(int cPage,Map<String,Object> searchRewardListFilter) {
		// TODO Auto-generated method stub
		return dao.selectSearchRewardList(cPage,searchRewardListFilter);
	}
	

	
}
