package com.spring.test.reward.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RewardDaoImpl implements RewardDao{
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Map<String,Object>>selectRewardCategory() {
		return session.selectList("reward.selectRewardCategoryMap");
	}
	
	
	@Override
	public int selectCurRewardNo() {
		return session.selectOne("reward.selectCurRewardNo");
	}
	
	@Override
	public int selectNextRewardNo() {
		return session.selectOne("reward.selectNextRewardNo");
	}
	
	@Override
	public int createProjectReward(Map<String, Object> param) {
		return session.insert("reward.insertProjectReward", param);
	}
	
	@Override
	public int updateRewardBasicInfo(Map<String, Object> param) {
		return session.update("reward.updateProjectRewardBasicInfo", param);
	}
}


