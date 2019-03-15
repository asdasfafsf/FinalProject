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
import com.spring.test.common.util.PageFactory;
@Controller
public class AdminController {
	@Autowired
	AdminService service;
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
}
