package com.spring.test.rewardlist.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.test.rewardlist.service.RewardlistService;
import com.spring.test.rewardlist.service.RewardlistServiceImpl;



@Controller
public class RewardlistController {

	@Autowired
	RewardlistService service;
	
	@RequestMapping("/rewardpage")
	public ModelAndView rewardList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage,@RequestParam(value="categoryNum", required=false, defaultValue="0") int categoryNum,
			@RequestParam(value="rewardState", required=false, defaultValue="1") int rewardState,@RequestParam(value="listFilter", required=false, defaultValue="1") int listFilter) {
		ModelAndView mv = new ModelAndView();
		
		Map<String,Integer> rewardListFilter=new HashMap();
		rewardListFilter.put("categoryNum",categoryNum);
		rewardListFilter.put("rewardState",rewardState);
		rewardListFilter.put("listFilter",listFilter);
		
		mv.addObject("rewardList",service.selectRewardList(cPage,rewardListFilter));
		mv.setViewName("/reward_list");
		
		return mv;
	}
	
	@RequestMapping("/rewardCategoryPage")
	@ResponseBody
	public List rewardCategoryPage(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage,@RequestParam(value="categoryNum", required=false, defaultValue="0") int categoryNum,
			@RequestParam(value="rewardState", required=false, defaultValue="1") int rewardState,@RequestParam(value="listFilter", required=false, defaultValue="1") int listFilter) {
		
		Map<String,Integer> rewardListFilter=new HashMap();
		rewardListFilter.put("categoryNum",categoryNum);
		rewardListFilter.put("rewardState",rewardState);
		rewardListFilter.put("listFilter",listFilter);
		
		List rewardCategoryList = service.selectRewardList(cPage,rewardListFilter);
		
		return rewardCategoryList;
	}
	
}
