package com.spring.test.account.dao;

import java.util.List;
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

	@Override
	public List<Map<String, Object>> selectRewardAccount(int rewardNo) {
		// TODO Auto-generated method stub
		return session.selectList("account.selectRewardAccount", rewardNo);
	}

	@Override
	public List<Map<String,Object>> selectLoadUserAccount(int userNo) {
		// TODO Auto-generated method stub
		return session.selectList("account.selectLoadUserAccount",userNo);
	}

	@Override
	public int deleteUserAccount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.delete("account.deleteUserAccount",param);
	}

	@Override
	public int insertUserAccount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.insert("account.insertUserAccount",param);
	}

	@Override
	public List<Map<String, Object>> selectWithdrawalUser(int rewardNo) {
		// TODO Auto-generated method stub
		return session.selectList("account.selectWithdrawalUser",rewardNo);
	}

	@Override
	public int updateSuccessWithdrawalUser(int reward_support_no) {
		// TODO Auto-generated method stub
		return session.update("account.updateSuccessWithdrawalUser",reward_support_no);
	}

	@Override
	public int updateFailWithdrawalUser(int reward_support_no) {
		// TODO Auto-generated method stub
		return session.update("account.updateFailWithdrawalUser",reward_support_no);
	}

	@Override
	public List<Map<String, Object>> selectDepositUser(int rewardNo) {
		// TODO Auto-generated method stub
		return session.selectList("account.selectDepositUser",rewardNo);
	}

	@Override
	public int updateUserToken(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("account.updateUserToken",param);
	}

	@Override
	public int updateSupportToken(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("account.updateSupportToken",param);
	}

	@Override
	public int updateRewardToken(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("account.updateRewardToken",param);
	}

}
