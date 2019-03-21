package com.spring.test.account.service;

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

}
