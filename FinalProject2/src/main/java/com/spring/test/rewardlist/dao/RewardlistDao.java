package com.spring.test.rewardlist.dao;

import java.util.List;
import java.util.Map;

public interface RewardlistDao {
	List<Map<String,String>> selectRewardList(int cPage,Map<String,Integer> rewardListFilter);
}
