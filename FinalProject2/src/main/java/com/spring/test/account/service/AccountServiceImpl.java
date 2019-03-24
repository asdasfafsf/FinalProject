package com.spring.test.account.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.test.account.dao.AccountDao;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	AccountDao dao;
	
	@Override
	public int updateRewardAccount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		
			   dao.deleteRewardAccount(param);
		return dao.insertRewardAccount(param);

	}

	@Override
	public List<Map<String, Object>> selectRewardAccount(int rewardNo) {
		// TODO Auto-generated method stub
		return dao.selectRewardAccount(rewardNo);
	}

	@Override
	public List<Map<String, Object>> selectLoadUserAccount(int userNo) {
		// TODO Auto-generated method stub
		return dao.selectLoadUserAccount(userNo);
	}

}
