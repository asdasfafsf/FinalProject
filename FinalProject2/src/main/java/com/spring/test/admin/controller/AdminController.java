package com.spring.test.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.test.admin.model.service.AdminService;
import com.spring.test.admin.model.vo.RewardAd;
import com.spring.test.common.util.PageFactory;
@Controller
public class AdminController {
	@Autowired
	AdminService service;
	//공지사항 상세보기
	@RequestMapping("/admin/noticeDetail")
	public ModelAndView noticeDetail(
			@RequestParam(value="idx",required=false,defaultValue="0")int noticeNo) {
		ModelAndView mv=new ModelAndView();
		System.out.println("공지사항 디테일");
		System.out.println("noticeNo:"+noticeNo);
		mv.addObject("check",1);
		mv.setViewName("/admin/admin_notice");
		return mv;
	}
	//공지사항
	@RequestMapping("/admin/notice")
	public ModelAndView noticeList(
			@RequestParam(value="cPage", 
			required=false, defaultValue="1") int cPage){
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		int contentCount=service.selectNoticeCount();
		List noticeList=service.selectNoticeList(cPage,numPerPage); 
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/notice"));
		mv.addObject("noticeList", noticeList);
		//System.out.println(noticeList);
		mv.addObject("check",0);
		mv.setViewName("/admin/admin_notice");
	
		return mv;
	}
	
	@RequestMapping("/admin/notice_search")
	public ModelAndView searchNoticeList(
			@RequestParam(value="cPage", 
			required=false, defaultValue="1") int cPage, HttpServletRequest request){
		String word=request.getParameter("adminSelectNotice_input");
		int numPerPage=10;
		System.out.println(",,ㅏ,ㅏ,ㅏ,  "+word);
		ModelAndView mv=new ModelAndView();
		if(word!=null) {
			int contentCount=service.selectSearchNoticeCount(word);
			List searchNoticeList=service.selectSearchNoticeList(cPage, numPerPage, word);
			mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/notice_search"));
			mv.addObject("noticeList",searchNoticeList);
			//System.out.println(searchNoticeList);
			mv.setViewName("/admin/admin_notice");
		}
		else {
			System.out.println("word 널이다");
		}
		mv.addObject("check",0);
		return mv;
	}
	//공지사항 삭제
	@RequestMapping("/admin/notice_delete")
	@ResponseBody
	public Map<String,Object> deleteNoticeList(
			@RequestParam(value="noList", required=false, defaultValue="0")List list) {
		System.out.println(list);
		service.deleteNoticeList(list);
		return new HashMap<String,Object>();
	}
	
	//이벤트
	@RequestMapping("/admin/event")
	public ModelAndView eventList(
			@RequestParam(value="cPage",
			required=false, defaultValue="1") int cPage){
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		int contentCount=service.selectEventCount();
		List eventList=service.selectEventList(cPage, numPerPage);
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/event"));
		mv.addObject("eventList",eventList);
		//System.out.println(eventList);
		mv.setViewName("/admin/admin_event");
		
		
		return mv;
	}
	
	@RequestMapping("/admin/event_serach")
	public ModelAndView searchEventList(
			@RequestParam(value="cPage",
			required=false, defaultValue="1") int cPage, HttpServletRequest request) {
		int numPerPage=10;
		String word=request.getParameter("adminSelectEvent_input");
		ModelAndView mv= new ModelAndView();
		int contentCount;
		List searchEventList;
		
		return mv;
	}
	//이벤트삭제
	@RequestMapping("/admin/event_delete")
	@ResponseBody
	public Map<String,Object> deletEventList(
			@RequestParam(value="noList",required=false,defaultValue="0")List list) {
		System.out.println(list);
		service.deleteEventList(list);
		return new HashMap<String,Object>();
	}
	
	//리워드
	//리워드 진행목록
	@RequestMapping("/admin/rewardList")
	public ModelAndView rewardIndexList(
			@RequestParam(value="cPage",
			required=false, defaultValue="1") int cPage) {
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		int contentCount=service.selectRewardIndexCount();
		List rewardIndexList=service.selectRewardIndexList(cPage, numPerPage);
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/rewardList"));
		mv.addObject("rewardIndexList",rewardIndexList);
		int check=0;
		mv.addObject("check",check);
		System.out.println(rewardIndexList);
		mv.setViewName("/admin/admin_reward_index");
		return mv;
	}
	//리워드 종료목록
	@RequestMapping("/admin/rewardStopList")	
	public ModelAndView rewardStopList(
			@RequestParam(value="cPage",
			required=false, defaultValue="1") int cPage) {
		ModelAndView mv=new ModelAndView();
		int numPerPage=10;
		int contentCount=service.selectRewardStopCount();
		List rewardStopList=service.selectRewardStopList(cPage, numPerPage);
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/rewardStopList"));
		mv.addObject("rewardIndexList",rewardStopList);
		int check=1;
		mv.addObject("check",check);
		mv.setViewName("/admin/admin_reward_index");
		System.out.println(rewardStopList);

		return mv;
	}
	//리워드 목록 종료
	@RequestMapping("/admin/reward_stop")
	@ResponseBody
	public Map<String, Object> stopRewardList(
			@RequestParam(value="noList", required=false, defaultValue="0")List list
			){
		System.out.println(list);
		int result= service.stopRewardList(list);
		return new HashMap<>();
	}
	//리워드 목록 삭제
		@RequestMapping("/admin/reward_delete")
		@ResponseBody
		public Map<String, Object> deleteRewardList(
				@RequestParam(value="noList", required=false, defaultValue="0")List list
				){
			System.out.println(list);
			int result= service.deleteRewardList(list);
			return new HashMap<>();
		}
	//리워드 광고 목록
	@RequestMapping("/admin/rewardADList")
	public ModelAndView rewardADList(
			@RequestParam(value="cPage",
			required=false, defaultValue="1") int cPage) {
		ModelAndView mv=new ModelAndView();
		int numPerPage=10;
		int contentCount=service.selectRewardAdCount();
		List rewardAdList=service.selectRewardAdList(cPage, numPerPage);
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/rewardAdList"));
		mv.addObject("rewardAdList",rewardAdList);
		mv.setViewName("/admin/admin_reward_advertisement");
		System.out.println(rewardAdList);
			
		return mv;
	}
	//리워드 광고 추가
	@RequestMapping("/admin/rewardAd_add")
	@ResponseBody
	public Map<String,Object> addRewardAd(
			@RequestParam(value="rewardNo", required=false, defaultValue="0") int rewardNo,
			@RequestParam(value="startDate", required=false, defaultValue="0") String startDate,
			@RequestParam(value="endDate", required=false, defaultValue="0") String endDate){
		System.out.println(rewardNo+startDate+endDate);
		RewardAd ra=new RewardAd();
		ra.setRewardNo(rewardNo);
		ra.setStartDate(startDate);
		ra.setEndDate(endDate);
		int result=service.insertRewardAd(ra);
		return new HashMap<>();
	}
	
}
