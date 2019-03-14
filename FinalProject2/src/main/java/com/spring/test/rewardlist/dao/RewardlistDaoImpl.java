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

	@Override
	public List<Map<String, String>> rewardRankList() {
		// TODO Auto-generated method stub
		RowBounds rowbounds=new RowBounds(0,5);
		return session.selectList("reward.rewardRankList",null,rowbounds);
	}

	@Override
	public List<Map<String, String>> open_schedule_rewardRankList() {
		// TODO Auto-generated method stub
		RowBounds rowbounds=new RowBounds(0,5);
		return session.selectList("reward.open_schedule_rewardRankList",null,rowbounds);
	}

	@Override
	public List<Map<String, String>> newest_open_schedule_rewardList() {
		// TODO Auto-generated method stub
		RowBounds rowbounds=new RowBounds(0,5);
		return session.selectList("reward.newest_open_schedule_rewardList",null,rowbounds);
	}

	@Override
	public List<Map<String, String>> deadline_approaching_rewardList() {
		// TODO Auto-generated method stub
		RowBounds rowbounds=new RowBounds(0,5);
		return session.selectList("reward.deadline_approaching_rewardList",null,rowbounds);
	}

	@Override
	public List<Map<String, String>> new_rewardList() {
		// TODO Auto-generated method stub
		RowBounds rowbounds=new RowBounds(0,5);
		return session.selectList("reward.new_rewardList",null,rowbounds);
	}

}
