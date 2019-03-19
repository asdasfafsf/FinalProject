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
			@RequestParam(value="rewardState", required=false, defaultValue="4") int rewardState,@RequestParam(value="listFilter", required=false, defaultValue="1") int listFilter) {
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
			@RequestParam(value="rewardState", required=false, defaultValue="4") int rewardState,@RequestParam(value="listFilter", required=false, defaultValue="1") int listFilter) {
		Map<String,Integer> rewardListFilter=new HashMap();
		rewardListFilter.put("categoryNum",categoryNum);
		rewardListFilter.put("rewardState",rewardState);
		rewardListFilter.put("listFilter",listFilter);
		
		List rewardCategoryList = service.selectRewardList(cPage,rewardListFilter);
		
		return rewardCategoryList;
	}
	
	@RequestMapping("/searchRewardList")
	public ModelAndView searchRewardList(
			@RequestParam(value="main_header_searchbar", required=false,defaultValue="0") String searchInform,
			@RequestParam(value="cPage", required=false, defaultValue="0") int cPage,
			@RequestParam(value="rewardState", required=false, defaultValue="4") int rewardState,
			@RequestParam(value="listFilter", required=false, defaultValue="1") int listFilter) {
		
		ModelAndView mv= new ModelAndView();
		
		Map<String,Object> searchRewardListFilter=new HashMap();
		searchRewardListFilter.put("searchInform",searchInform);
		searchRewardListFilter.put("rewardState",rewardState);
		searchRewardListFilter.put("listFilter",listFilter);
		
		//검색이 공백일때
		if(searchInform.equals("0")) {
			mv.setViewName("redirect:/mainPage");
		}else {
			mv.addObject("searchRewardList",service.selectSearchRewardList(cPage,searchRewardListFilter));
			mv.addObject("searchInform",searchInform);
			mv.setViewName("/searchRewardList");
		}
		
		return mv;
	}
	
	@RequestMapping("/searchRewardListAjax")
	@ResponseBody
	public List searchRewardListAjax(
			@RequestParam(value="main_header_searchbar", required=false,defaultValue="0") String searchInform,
			@RequestParam(value="cPage", required=false, defaultValue="0") int cPage,
			@RequestParam(value="rewardState", required=false, defaultValue="4") int rewardState,
			@RequestParam(value="listFilter", required=false, defaultValue="1") int listFilter) {
		
		ModelAndView mv= new ModelAndView();
		
		Map<String,Object> searchRewardListFilter=new HashMap();
		searchRewardListFilter.put("searchInform",searchInform);
		searchRewardListFilter.put("rewardState",rewardState);
		searchRewardListFilter.put("listFilter",listFilter);
		

		List searchRewardList=service.selectSearchRewardList(cPage,searchRewardListFilter);
		
		
		return searchRewardList;
	}
}
