package com.spring.test.reward.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.test.reward.service.RewardService;

import net.sf.json.JSONObject;

@Controller
public class RewardController {
	@Autowired
	RewardService service;
	
	@RequestMapping("/project/rewardwrite/")
	public ModelAndView writeReward() {
		ModelAndView mv = new ModelAndView();
		JSONObject json = new JSONObject();
		json.put("rewardNo", service.selectNextRewardNo());
		mv.addObject("rewardNo",service.selectNextRewardNo());
		mv.addObject("rewardInfo", json);
		mv.setViewName("/reward/rewardwrite");
		
		
		System.out.println("¾È³ç?");
		
		return mv;
	}
	
	@RequestMapping("/project/reward/{rewardNo}")
	public ModelAndView showRewardStory(@PathVariable("rewardNo") int rewardNo) {
		ModelAndView mv = new ModelAndView("/reward/rewardstory");
		
	
		
		return mv;
	}
	
	@RequestMapping("/project/reward/notice/{rewardNo}")
	public ModelAndView showRewardNotice(@PathVariable("rewardNo") int rewardNo) {
		ModelAndView mv = new ModelAndView("/reward/rewardnotice");
		
	
		
		return mv;
	}
	
	@RequestMapping("/project/reward/comment/{rewardNo}")
	public ModelAndView showRewardComment(@PathVariable("rewardNo") int rewardNo) {
		ModelAndView mv = new ModelAndView("/reward/rewardcomment");
		
	
		
		return mv;
	}

}
