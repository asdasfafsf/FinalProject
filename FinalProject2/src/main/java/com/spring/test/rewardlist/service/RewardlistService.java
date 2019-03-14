package com.spring.test.rewardlist.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

public interface RewardlistService {
	List<Map<String,String>> selectRewardList(int cPage,Map<String,Integer> rewardListFilter);
	List<Map<String,String>> rewardRankList();
	List<Map<String,String>> open_schedule_rewardRankList();
	List<Map<String,String>> newest_open_schedule_rewardList();
	List<Map<String,String>> deadline_approaching_rewardList();
	List<Map<String,String>> new_rewardList();
}
