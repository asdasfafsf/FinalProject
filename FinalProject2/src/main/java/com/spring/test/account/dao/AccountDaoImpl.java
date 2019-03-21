package com.spring.test.account.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDaoImpl implements AccountDao {

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int deleteRewardAccount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.delete("account.deleteRewardAccount",param);
	}

	@Override
	public int insertRewardAccount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.insert("account.insertRewardAccount",param);
	}

}
