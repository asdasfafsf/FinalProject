package com.spring.test.rewardlist.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

public interface RewardlistService {
	List<Map<String,String>> selectRewardList(int cPage,Map<String,Integer> rewardListFilter);
	
}
