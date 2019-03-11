package com.spring.test.rewardlist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RewardlistDaoImpl implements RewardlistDao{
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Map<String, String>> selectRewardList(int cPage,Map<String,Integer> rewardListFilter) {
		// TODO Auto-generated method stub
		RowBounds rowbounds=new RowBounds(cPage*6, 6);
		return session.selectList("reward.selectRewardList",rewardListFilter,rowbounds);
	}

}
