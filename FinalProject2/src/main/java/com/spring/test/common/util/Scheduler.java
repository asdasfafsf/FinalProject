package com.spring.test.common.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.spring.test.reward.model.dao.RewardDao;
import com.spring.test.reward.model.dao.RewardDaoImpl;

@Component
public class Scheduler {

	@Autowired
	RewardDao dao;
	
	//매 0시마다 실행됨
	@Scheduled(cron="0 0 0 * * *")
	public void cronTest1() {
		dao.updateStateOpenSchedule();
		dao.updateRewardOpen();
		System.out.println("실행");
		dao.updateOpenScheduleRewardOpen();
		dao.updateRewardSuccess();
		dao.updateRewardFail();
	}
	
	
}
