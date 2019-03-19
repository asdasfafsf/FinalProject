package com.spring.test.rewardlist.dao;

import java.util.List;
import java.util.Map;

public interface RewardlistDao {
	List<Map<String,String>> selectRewardList(int cPage,Map<String,Integer> rewardListFilter);
	List<Map<String,String>> rewardRankList();
	List<Map<String,String>> open_schedule_rewardRankList();
	List<Map<String,String>> newest_open_schedule_rewardList();
	List<Map<String,String>> deadline_approaching_rewardList();
	List<Map<String,String>> new_rewardList();
	List<Map<String,String>> selectSearchRewardList(int cPage,Map<String,Object> searchRewardListFilter);
}
