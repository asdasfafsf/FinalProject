package com.spring.test.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.test.advertisement.service.AdvertisementService;
import com.spring.test.event.service.EventService;
import com.spring.test.notice.service.NoticeService;
import com.spring.test.rewardlist.service.RewardlistService;

@Controller
public class MainController {

	@Autowired
	NoticeService notice_service;
	@Autowired
	AdvertisementService ad_service;
	@Autowired
	RewardlistService rewardList_service;
	@Autowired
	EventService event_service;
	
	@RequestMapping("/mainPage")
	public ModelAndView MainPage() {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("noticeList",notice_service.selectMainNoticeList());
		mv.addObject("advertisementList",ad_service.selectAdList());
		mv.addObject("ongoing_rewardRankList",rewardList_service.rewardRankList());
		mv.addObject("open_schedule_rewardRankList",rewardList_service.open_schedule_rewardRankList());
		mv.addObject("newest_open_schedule_rewardList",rewardList_service.newest_open_schedule_rewardList());
		mv.addObject("deadline_approaching_rewardList",rewardList_service.deadline_approaching_rewardList());
		mv.addObject("new_rewardList",rewardList_service.new_rewardList());
		mv.addObject("main_slide_eventList",event_service.main_slide_eventList());
		
		mv.setViewName("/main");
		
		return mv;
	}
	
	@RequestMapping("/fundingStory")
	public String FundingStory(){
		return "fundingstory";
	}
}
